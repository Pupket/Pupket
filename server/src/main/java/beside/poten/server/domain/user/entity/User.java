package beside.poten.server.domain.user.entity;

import beside.poten.server.domain.user.constant.Role;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Getter
@NoArgsConstructor
@Entity
public class User {

    @Id
    @GeneratedValue
    private String email;

    @Column(unique = true, nullable = false)
    private String oAuth2Id;

    @Column(unique = true)
    private String nickname;

    @Column(unique = false)
    private String password;

    @Column(nullable = false)
    @Enumerated(value = EnumType.STRING)
    private Role role;
}
