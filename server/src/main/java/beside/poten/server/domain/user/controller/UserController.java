package beside.poten.server.domain.user.controller;

import beside.poten.server.domain.user.dto.request.SignUpReq;
import beside.poten.server.domain.user.dto.request.SocialSignUpReq;
import beside.poten.server.domain.user.dto.request.UpdateReq;
import beside.poten.server.domain.user.dto.response.FindUserReq;
import beside.poten.server.domain.user.service.UserService;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/account/")
@Slf4j
public class UserController {

    private final UserService userService;


    @Schema(description = "일반회원가입")
    @PostMapping("/sign-up")
    public ResponseEntity signUp(@RequestPart SignUpReq signUpReq
            ) throws IOException {

        userService.signUp(signUpReq);


        return ResponseEntity.status(HttpStatus.OK).build();

    }


    @Schema(description = "소셜 회원 추가정보 요청 ")
    @PostMapping("/social/sign-up")
    @PreAuthorize("hasRole('GUEST') ")
    public ResponseEntity socialSignUp(@RequestPart(value = "socialSignUpReq") SocialSignUpReq socialSignUpReq
            , HttpServletRequest request) throws IOException {


     userService.signUpSocialMember(socialSignUpReq, request);


        return ResponseEntity.ok(HttpStatus.OK);

    }

    @Schema(description = "토큰으로 회원 조회")
    @GetMapping("/find-user")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity findUser(HttpServletRequest request) throws IOException {

        FindUserReq user = userService.findUser(request);
//        byte[] profileImg = userService.findPorfileImg(request);
//        List<Object> sendData = new ArrayList<>();
//        sendData.add(user);
//        sendData.add(profileImg);

        return ResponseEntity.status(HttpStatus.OK).body(user);

    }

    @Schema(description = "id값으로 회원 조회")
    @GetMapping("/find-user/{id}")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity findUserById(@PathVariable("id") int id, HttpServletRequest request) throws IOException {


        FindUserReq user = userService.findUser(id);
//        if (user.getProfileImg() != null) {
//        byte[] profileImg = userService.findPorfileImg(request);
//        List<Object> sendData = new ArrayList<>();
//
//        sendData.add(user);
//        sendData.add(profileImg);
//        return ResponseEntity.status(HttpStatus.OK).body(sendData);
//        }

        return ResponseEntity.status(HttpStatus.OK).body(user);


    }

    @Schema(description = "회원 정보 수정")
    @PatchMapping("/update/{id}")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity update(@PathVariable("id") int id, @RequestBody UpdateReq updateReq) throws IOException {

        FindUserReq user = userService.update(id, updateReq);

        return ResponseEntity.status(HttpStatus.OK).body(user);
    }


    @Schema(description = "회원 철회")
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity delete(@PathVariable("id") int id) throws BadRequestException {
        userService.delete(id);

        return ResponseEntity.status(HttpStatus.OK).build();

    }



}