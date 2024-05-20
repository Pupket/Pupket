package beside.poten.server.domain.user.controller;

import beside.poten.server.domain.user.dto.SignUpReq;
import beside.poten.server.domain.user.dto.SocialSignUpReq;
import beside.poten.server.domain.user.dto.UpdateReq;
import beside.poten.server.domain.user.entity.User;
import beside.poten.server.domain.user.service.FileService;
import beside.poten.server.domain.user.service.UserService;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.MalformedURLException;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/account/")
@Slf4j
public class UserController {

    private final UserService userService;
    private final FileService fileService;
    private final AmazonS3Client amazonS3Client;
    private final AmazonS3 amazonS3;

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;




    @Schema(description = "일반회원가입")
    @PostMapping("/sign-up")
    public ResponseEntity signUp(@RequestBody SignUpReq signUpReq) throws BadRequestException {
        log.info(signUpReq.getEmail());

        userService.signUp(signUpReq);


        return ResponseEntity.status(HttpStatus.OK).build();

    }

    @Schema(description = "소셜 회원 추가정보 요청 ")
    @PostMapping("/social/sign-up")
    @PreAuthorize("hasRole('GUEST') ")
    public ResponseEntity socialSignUp(@RequestBody SocialSignUpReq socialSignUpReq, HttpServletRequest request) {


        User socialMember = userService.signUpSocialMember(socialSignUpReq, request);


        return ResponseEntity.status(HttpStatus.OK).body(socialMember);

    }

    @Schema(description = "회원 정보 수정")
    @PatchMapping("/update/{id}")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity update(@PathVariable("id") Long id, @RequestBody UpdateReq updateReq) throws BadRequestException {

        User updatedUser = userService.update(id, updateReq);

        return ResponseEntity.status(HttpStatus.OK).body(updatedUser);
    }

    @Schema(description = "회원 철회")
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity delete(@PathVariable("id") Long id) throws BadRequestException {

        userService.delete(id);

        return ResponseEntity.status(HttpStatus.OK).build();

    }

    @Schema(description = "테스트용 파일 업로드")
    @PostMapping("/file-upload")
    public ResponseEntity fileDownload(@RequestParam("test")  MultipartFile multipartFile) throws IOException {
        if (multipartFile != null) {
        fileService.saveFile(multipartFile);

        }else{
            log.info("multipartFile={}",multipartFile);
        }


        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @Schema(description = "테스트용 파일 다운로드")
    @GetMapping("/file-download")
    public ResponseEntity<UrlResource> downloadImage(String originalFilename) throws MalformedURLException {


        // NCP Object Storage의 파일 URL을 생성
        String fileUrl = "https://kr.object.ncloudstorage.com/" + bucket + "/" + originalFilename;
        UrlResource urlResource = new UrlResource(fileUrl);

        log.info("urlResource={}", urlResource);
        String contentDisposition = "attachment; filename=\"" + originalFilename + "\"";
        log.info("contentDisposition={}", contentDisposition);

        // header에 CONTENT_DISPOSITION 설정을 통해 클릭 시 다운로드 진행
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                .body(urlResource);


    }


}