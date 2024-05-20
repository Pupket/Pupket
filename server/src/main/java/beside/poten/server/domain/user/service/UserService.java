package beside.poten.server.domain.user.service;

import beside.poten.server.domain.user.constant.RoleType;
import beside.poten.server.domain.user.constant.UserGender;
import beside.poten.server.domain.user.constant.UserStatus;
import beside.poten.server.domain.user.dto.SignUpReq;
import beside.poten.server.domain.user.dto.SocialSignUpReq;
import beside.poten.server.domain.user.dto.UpdateReq;
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


    @Value("${cloud.aws.s3.bucket}")
    private String bucketName;



    public void signUp(SignUpReq signUpReq) throws BadRequestException {

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

        user.encodePassword(passwordEncoder);
        user.updateCreateDate();
        user.updateLastModifed();
        user.updateIsDeleted("N");


        userRepository.save(user);


    }

    public User signUpSocialMember(SocialSignUpReq socialSignUpReq, HttpServletRequest request) {

        String accessToken = jwtService.extractAccessToken(request);
        log.info("accessToken =" + accessToken);
        String loginId=  jwtService.extractLoginIdFromAccessToken(accessToken);

        log.info("loginId={}",loginId);




        User findMember = userRepository.findByEmail(loginId).get();
        log.info("memberOauthID={} ", findMember.getOauth2Id());

        findMember.updateKakaoMember(
                socialSignUpReq.getName(),
                socialSignUpReq.getNickname(),
                socialSignUpReq.getProfileImage(),
                socialSignUpReq.getBirthDay(),
                socialSignUpReq.getContact(),
                socialSignUpReq.getAddress()

        );
        findMember.updateIsDeleted("N");
        findMember.updateCreateDate();
        findMember.updateLastModifed();
        userRepository.save(findMember);

        return findMember;

    }

    public User update(Long id, UpdateReq updateReq) throws BadRequestException {
        Optional<User> findMemberById = userRepository.findById(id);
        if(findMemberById.isPresent()) {
            User user = findMemberById.get();

            user.updateMember(
                    updateReq.getName(),
                    updateReq.getNickname(),
                    updateReq.getProfileImage(),
                    updateReq.getContact(),
                    updateReq.getAddress()
            );

            userRepository.save(user);

            return user;
        }
        else{
            throw new BadRequestException();
        }

    }

    @Transactional
    public void delete(Long id) throws BadRequestException {

        Optional<User> findMemberById = userRepository.findById(id);
        if(findMemberById.isPresent()) {
           jpaQueryFactory.update(user)
                   .set(user.status,UserStatus.WITHDRAW)
                   .where(user.id.eq(id)).execute();
        }else {
            throw new BadRequestException();
        }
    }

}
