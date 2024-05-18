package beside.poten.server.global.config;

import beside.poten.server.global.filter.CustomJsonUsernamePasswordAuthenticationFilter;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutFilter;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final ObjectMapper objectMapper;


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/api/v1/account/login").permitAll() // 로그인 허용
                                .anyRequest().authenticated()
                ).oauth2Login( login -> login.defaultSuccessUrl("/login", true));
        http.addFilterAfter(customJsonUsernamePasswordAuthenticationFilter(), LogoutFilter.class);


        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setPasswordEncoder(passwordEncoder());
        return new ProviderManager(provider);
    }



    @Bean
    public CustomJsonUsernamePasswordAuthenticationFilter customJsonUsernamePasswordAuthenticationFilter() {
        CustomJsonUsernamePasswordAuthenticationFilter customJsonUsernamePasswordLoginFilter
                = new CustomJsonUsernamePasswordAuthenticationFilter(objectMapper);
        customJsonUsernamePasswordLoginFilter.setAuthenticationManager(authenticationManager());



        return customJsonUsernamePasswordLoginFilter;
    }
}
