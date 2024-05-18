package beside.poten.server.domain.user.controller;

import beside.poten.server.global.auth.dto.AuthRequest;
import beside.poten.server.global.auth.dto.AuthResponse;
import beside.poten.server.global.auth.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/account/")
public class UserController {

    private final AuthService authService;

    @GetMapping("/login")
    public Map<String, Object> login(@AuthenticationPrincipal OAuth2User request) {
        return request.getAttributes();
    }

    @PostMapping("/update")
    public ResponseEntity<AuthResponse> authenticate(@RequestBody AuthRequest request) {
        return ResponseEntity.ok(authService.authenticate(request));
    }
}
