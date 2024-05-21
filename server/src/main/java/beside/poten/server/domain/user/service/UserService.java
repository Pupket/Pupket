package beside.poten.server.domain.user.service;

import beside.poten.server.domain.user.constant.RoleType;
import beside.poten.server.domain.user.constant.UserGender;
import beside.poten.server.domain.user.constant.UserStatus;
import beside.poten.server.domain.user.dto.request.SignUpReq;
import beside.poten.server.domain.user.dto.request.SocialSignUpReq;
import beside.poten.server.domain.user.dto.request.UpdateReq;
import beside.poten.server.domain.user.dto.response.FindUserReq;
import beside.poten.server.domain.user.entity.User;
import beside.poten.server.domain.user.repository.UserRepository;
import beside.poten.server.global.jwt.service.JwtService;
import com.amazonaws.services.s3.AmazonS3;
import com.querydsl.jpa.impl.JPAQueryFactory;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;

import static beside.poten.server.domain.user.entity.QUser.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final JPAQueryFactory jpaQueryFactory;


    private final AmazonS3 amazonS3;
    private final FileService fileService;


    @Value("${cloud.aws.s3.bucket}")
    private String bucketName;







    public void signUp(SignUpReq signUpReq, MultipartFile profileImg) throws IOException {


        if (signUpReq.getEmail() == null || signUpReq.getPassword() == null) {
            throw new BadRequestException("아이디 또는 비밀번호가 비어 있습니다.");
        }


        User user = User.builder()
                .email(signUpReq.getEmail())
                .password(signUpReq.getPassword())
                .name(signUpReq.getName())
                .address(signUpReq.getAddress())
                .contact(signUpReq.getContact())
                .nickname(signUpReq.getNickname())
                .role(RoleType.USER)
                .status(UserStatus.ACTIVE)
                .gender(UserGender.valueOf(signUpReq.getGender()))
                .build();

        if (profileImg != null) {
            String newName = fileService.convertName(profileImg.getOriginalFilename());
            user.updateProfileImg(newName);
            fileService.saveFile(profileImg, newName);
        }



        user.encodePassword(passwordEncoder);
        user.updateCreateDate();
        user.updateLastModifed();
        user.updateIsDeleted("N");


        userRepository.save(user);


    }



    public User signUpSocialMember(SocialSignUpReq socialSignUpReq, HttpServletRequest request, MultipartFile profileImg) throws IOException {

        String accessToken = jwtService.extractAccessToken(request);
        log.info("accessToken =" + accessToken);
        String loginId=  jwtService.extractLoginIdFromAccessToken(accessToken);

        log.info("loginId={}",loginId);

        User findMember = userRepository.findByEmail(loginId).get();
        log.info("memberOauthID={} ", findMember.getOauth2Id());

        findMember.updateKakaoMember(
                socialSignUpReq.getName(),
                socialSignUpReq.getNickname(),
                socialSignUpReq.getBirthDay(),
                socialSignUpReq.getContact(),
                socialSignUpReq.getAddress(),
                UserGender.valueOf(socialSignUpReq.getGender())
        );

        if (profileImg != null) {
            String newName = fileService.convertName(profileImg.getOriginalFilename());
            findMember.updateProfileImg(newName);
            fileService.saveFile(profileImg, newName);
        }
        findMember.updateIsDeleted("N");
        findMember.updateCreateDate();
        findMember.updateLastModifed();
        userRepository.save(findMember);

        return findMember;

    }

    public FindUserReq update(int id, UpdateReq updateReq, MultipartFile profileImg) throws IOException {
        Optional<User> findMemberById = userRepository.findById(Long.valueOf(id));
        if(findMemberById.isPresent()) {
            User findMember = findMemberById.get();

            findMember.updateMember(
                    updateReq.getName(),
                    updateReq.getNickname(),
                    updateReq.getProfileImage(),
                    updateReq.getContact(),
                    updateReq.getAddress()
            );

            if (profileImg != null) {
                String newName = fileService.convertName(profileImg.getOriginalFilename());
                findMember.updateProfileImg(newName);
                fileService.deleteFile(findMember.getProfileImage());
                fileService.saveFile(profileImg, newName);
            }
            userRepository.save(findMember);

            return FindUserReq.builder()
                    .id(findMember.getId())
                    .name(findMember.getName())
                    .profileImg(findMember.getProfileImage())
                    .contact(findMember.getContact())
                    .address(findMember.getAddress())
                    .nickname(findMember.getNickname())
                    .build();


        }
        else{
            throw new BadRequestException();
        }

    }

    @Transactional
    public void delete(int id) throws BadRequestException {

        Optional<User> findMemberById = userRepository.findById(Long.valueOf(id));
        if(findMemberById.isPresent()) {
           jpaQueryFactory.update(user)
                   .set(user.status,UserStatus.WITHDRAW)
                   .where(user.id.eq(Long.valueOf(id))).execute();
        }else {
            throw new BadRequestException();
        }
    }

    public FindUserReq findUser(HttpServletRequest request) {
        String accessToken = jwtService.extractAccessToken(request);
        log.info("accessToken =" + accessToken);
        String loginId=  jwtService.extractLoginIdFromAccessToken(accessToken);

        log.info("loginId={}",loginId);

        User findMember = userRepository.findByEmail(loginId).get();

        return FindUserReq.builder()
                .id(findMember.getId())
                .name(findMember.getName())
                .profileImg(findMember.getProfileImage())
                .contact(findMember.getContact())
                .address(findMember.getAddress())
                .nickname(findMember.getNickname())
                .gender(String.valueOf(findMember.getGender()))
                .build();

    }


    public FindUserReq findUser(int id) {

        log.info("id={}",id);
        User findMember = userRepository.findById(Long.valueOf(id)).get();
        log.info("findMember = {} " ,findMember);


        return FindUserReq.builder()
                .id(findMember.getId())
                .name(findMember.getName())
                .profileImg(findMember.getProfileImage())
                .contact(findMember.getContact())
                .address(findMember.getAddress())
                .nickname(findMember.getNickname())
                .build();

    }

    public byte[] findPorfileImg(HttpServletRequest request) throws IOException {

        String accessToken = jwtService.extractAccessToken(request);
        log.info("accessToken =" + accessToken);
        String loginId=  jwtService.extractLoginIdFromAccessToken(accessToken);

        log.info("loginId={}",loginId);

        User findMember = userRepository.findByEmail(loginId).get();


        return fileService.loadFileInS3(findMember.getProfileImage(), request);


    }
}
