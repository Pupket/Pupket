package beside.poten.server.global.jwt.service;

import beside.poten.server.domain.user.entity.User;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class JwtService {
    @Value("${application.security.jwt.secret}")
    private String jwtSecret;

    @Value("${application.security.jwt.expiration}")
    private String jwtExpiration;

    // 유저 정보를 통해 토큰 발급
    public String generateToken(User user) {
        return generateToken(new HashMap<>(), user);
    }

    // 유저 정보 및 추가 클레임을 통해 토큰 발급
    public String generateToken(
            Map<String, Object> extraClaims,
            User user
    ) {
        return buildToken(extraClaims, user, Long.parseLong(jwtExpiration));
    }

    public String generateRefreshToken(
            User user
    ) {
        return buildToken(new HashMap<>(), user, Long.parseLong(jwtExpiration));
    }

    // JWT 토큰 생성
    private String buildToken(
            Map<String, Object> extraClaims,
            User user,
            long expiration
    ) {
        return Jwts
                .builder()
                .setClaims(extraClaims) // 추가 클레임 정보 설정
                .setSubject(user.getOAuth2Id())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + expiration))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    private Key getSignInKey() {
        byte[] keyByte = Decoders.BASE64.decode(jwtSecret);
        return Keys.hmacShaKeyFor(keyByte);
    }
}
