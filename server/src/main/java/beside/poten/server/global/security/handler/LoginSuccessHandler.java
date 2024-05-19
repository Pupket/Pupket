package beside.poten.server.global.security.handler;


import beside.poten.server.domain.user.entity.User;
import beside.poten.server.domain.user.repository.UserRepository;
import beside.poten.server.global.jwt.service.JwtService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import java.io.IOException;

@Slf4j
@RequiredArgsConstructor
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final JwtService jwtService;
    private final UserRepository userRepository;

    @Value("${jwt.access.expiration}")
    private String accessTokenExpriation;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        String email = extractUsername(authentication);

        String accessToken = jwtService.createAccessToken(email);
        String refreshToken = jwtService.createRefreshToken();

        jwtService.sendAccessAndRefreshToken(response, accessToken, refreshToken);

        User user = userRepository.findByEmail(email).orElseThrow(IllegalArgumentException::new);

        user.updateLastModifed();
        user.updateCreateDate();
        user.updateIsDeleted("N");
        user.updateRefreshToken(refreshToken);
        userRepository.saveAndFlush(user);

    }

    private String extractUsername(Authentication authentication) {

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        return userDetails.getUsername();


    }
}
