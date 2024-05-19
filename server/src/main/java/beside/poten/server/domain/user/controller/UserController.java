package beside.poten.server.domain.user.controller;

import beside.poten.server.domain.user.dto.SignUpReq;
import beside.poten.server.domain.user.dto.SocialSignUpReq;
import beside.poten.server.domain.user.dto.UpdateReq;
import beside.poten.server.domain.user.entity.User;
import beside.poten.server.domain.user.service.userService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/account/")
@Slf4j
public class UserController {

    private final userService userService;


    @PostMapping("/sign-up")
    public ResponseEntity signUp(@RequestBody SignUpReq signUpReq) throws BadRequestException {
        log.info(signUpReq.getEmail());

        userService.signUp(signUpReq);


        return ResponseEntity.status(HttpStatus.OK).build();

    }

    @PostMapping("/social/sign-up")
    @PreAuthorize("hasRole('GUEST') ")
    public ResponseEntity socialSignUp(@RequestBody SocialSignUpReq socialSignUpReq, HttpServletRequest request) {


        User socialMember = userService.signUpSocialMember(socialSignUpReq, request);


        return ResponseEntity.status(HttpStatus.OK).body(socialMember);

    }

    @PatchMapping("/update/{id}")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity update(@PathVariable("id") Long id, @RequestBody UpdateReq updateReq) throws BadRequestException {

        User updatedUser = userService.update(id, updateReq);

        return ResponseEntity.status(HttpStatus.OK).body(updatedUser);
    }

    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity delete(@PathVariable("id") Long id) throws BadRequestException {

        userService.delete(id);

        return ResponseEntity.status(HttpStatus.OK).build();

    }
}