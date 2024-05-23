package beside.poten.server.global.oauth.entity;

import beside.poten.server.domain.user.constant.RoleType;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;

import java.util.Collection;
import java.util.Map;

@Getter
public class CustomOAuth2User extends DefaultOAuth2User {

    private final String email;
    private final RoleType role;


    public CustomOAuth2User(Collection<? extends GrantedAuthority> authorities,
                            Map<String, Object> attributes, String nameAttributeKey,
                            String loginId, RoleType role) {
        super(authorities, attributes, nameAttributeKey);
        this.email = loginId;
        this.role = role;
    }
}

