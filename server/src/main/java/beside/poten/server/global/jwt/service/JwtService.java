package beside.poten.server.global.jwt.service;


import beside.poten.server.domain.user.entity.User;
import beside.poten.server.domain.user.repository.UserRepository;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.InvalidPropertyException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ScopeMetadata;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Getter
@Slf4j
public class JwtService {

    @Value("${jwt.secretKey}")
    private String secretKey;

    @Value("${jwt.access.expiration}")
    private Long accessTokenExpirationPeriod;

    @Value("${jwt.refresh.expiration}")
    private Long refreshTokenExpirationPeriod;

    @Value("${jwt.access.header}")
    private String accessHeader;

    @Value("${jwt.refresh.header}")
    private String refreshHeader;

    private static final String ACCESS_TOKEN_SUBJECT = "AccessToken";
    private static final String REFRESH_TOKEN_SUBJECT = "RefreshToken";
    private static final String EMAIL_CLAIM = "email";
    private static final String BEARER = "Bearer ";

    private final UserRepository userRepository;

    public String createAccessToken(String email) {
        Date now = new Date();
        Date expiration = new Date(now.getTime() + accessTokenExpirationPeriod);


        if (secretKey.isEmpty() || secretKey == null) {
            throw new IllegalArgumentException("Secret key is empty");
        }

        return JWT.create()
                .withSubject(ACCESS_TOKEN_SUBJECT)
                .withExpiresAt(expiration)
                .withClaim(EMAIL_CLAIM, email)
                .sign(Algorithm.HMAC512(secretKey));
    }

    public String createRefreshToken() {
        Date now = new Date();
        Date expiration = new Date(now.getTime() + refreshTokenExpirationPeriod);


        if (secretKey.isEmpty() || secretKey == null) {
            throw new IllegalArgumentException("Secret key is empty");
        }

        log.info("Refresh token is creating");
        return JWT.create()
                .withSubject(REFRESH_TOKEN_SUBJECT)
                .withExpiresAt(expiration)
                .sign(Algorithm.HMAC512(secretKey));

    }

    public void sendAccessToken(HttpServletResponse response, String accessToken) {
        response.setStatus(HttpServletResponse.SC_OK);

        response.setHeader(accessHeader, accessToken);
        log.info("재발급된 Access Token : {}", accessToken);
    }

    public void sendAccessAndRefreshToken(HttpServletResponse response, String accessToken, String refreshToken) {

        setAccessTokenHeader(response, accessToken);
        setRefreshTokenHeader(response, refreshToken);
        log.info("Access Token, Refresh Token 헤더 설정 완료");
    }

    public String extractRefreshToken(HttpServletRequest request) {
        String header = request.getHeader(refreshHeader);
        if (header == null) {
            throw new AuthenticationServiceException("Refresh Token 헤더가 없습니다.");
        }
        if (!header.startsWith(BEARER)) {
            throw new AuthenticationServiceException("Refresh Token 헤더가 올바르지 않습니다.");
        }
        log.info("extractRefreshToken={}", header.replace(BEARER, ""));
        return header.replace(BEARER, "").trim();

    }

    public String extractAccessToken(HttpServletRequest request) {
        String header = request.getHeader(accessHeader);
        if (header == null) {
            throw new AuthenticationServiceException("Access Token 헤더가 없습니다.");
        }
        if (!header.startsWith(BEARER)) {
            throw new AuthenticationServiceException("Access Token 헤더가 올바르지 않습니다.");
        }
        log.info("ExtractaccessToken={}", header.replace(BEARER, ""));
        return header.split(" ")[1];

    }

    public String getEmail(String accessToken) {
        return JWT
                .require(Algorithm.HMAC512(secretKey))
                .build()
                .verify(accessToken)
                .getClaim(EMAIL_CLAIM)
                .asString();

    }

    public void setAccessTokenHeader(HttpServletResponse response, String accessToken) {
        response.setHeader(accessHeader, accessToken);
    }

    public void setRefreshTokenHeader(HttpServletResponse response, String refreshToken) {
        response.setHeader(refreshHeader, refreshToken);
    }

    public void updateRefreshToken(String loginId, String refreshToken) {
        Optional<User> findMember = userRepository.findByEmail(loginId);

        if (findMember.isPresent()) {
            User user = findMember.get();
            user.updateRefreshToken(refreshToken);
            userRepository.save(user);
            log.info("Refresh token updated for user: {}", loginId);
        } else {
            throw new IllegalArgumentException("일치하는 회원이 없습니다.");
        }
    }


    public boolean isTokenValid(String token) {
        try {
            JWT.require(Algorithm.HMAC512(secretKey)).build().verify(token);
            return true;
        } catch (JWTVerificationException e) {
            log.error("유효하지 않은 토큰입니다. {}", e.getMessage());
            return false;
        }
    }

    public String extractLoginIdFromAccessToken(String accessToken) {
        return JWT.require(Algorithm.HMAC512(secretKey))
                .build()
                .verify(accessToken)
                .getClaim(EMAIL_CLAIM)
                .asString();
    }

    public Map<String, Object> verifyJWT(String jwt) {
        Map<String, Object> claimMap = null;
        try {
            Claims claims = Jwts.parser()
                    .setSigningKey(secretKey.getBytes("UTF-8")) // Set Key
                    .parseClaimsJws(jwt) // 파싱 및 검증, 실패 시 에러
                    .getBody();
            claimMap = claims;
        } catch (ExpiredJwtException e) { // 토큰이 만료되었을 경우
            System.out.println(e);
        } catch (Exception e) { // 그외 에러났을 경우
            System.out.println(e);
        }
        return claimMap;
    }

}
