package beside.poten.server.global.auth.service;

import beside.poten.server.global.auth.dto.AuthRequest;
import beside.poten.server.global.auth.dto.AuthResponse;
import beside.poten.server.global.jwt.entity.Token;
import beside.poten.server.global.jwt.repository.TokenRepository;
import beside.poten.server.domain.user.repository.UserRepository;
import beside.poten.server.domain.user.entity.User;
import beside.poten.server.global.jwt.service.JwtService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final TokenRepository tokenRepository;
    private final JwtService jwtService;

    /**
     * Access Token 및 Refresh Token을 발급하여 반환한다
     *
     * @param data 사용자 인증 요청 정보
     * @return AuthenticationResponse (JWT 및 Refresh Token을 포함)
     */
    public AuthResponse authenticate(AuthRequest data) {
        User user = userRepository.findByEmail(data.getEmail()).orElseThrow();
        var token = Token.builder()
                .grantType("BEARER")
                .accessToken(jwtService.generateToken(user))
                .refreshToken(jwtService.generateRefreshToken(user))
                .build();
        saveUserToken(token);

        return AuthResponse.builder()
                .accessToken(token.getAccessToken())
                .refreshToken(token.getRefreshToken())
                .build();
    }

    /**
     * JWT Token을 저장한다
     *
     * @param token
     */
    private void saveUserToken(Token token) {
        tokenRepository.save(token);
    }
}
