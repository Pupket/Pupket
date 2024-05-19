package beside.poten.server.domain.user.entity;

import beside.poten.server.domain.user.constant.UserGender;
import beside.poten.server.domain.user.constant.UserRole;
import beside.poten.server.domain.user.constant.UserStatus;
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
    @Column(unique = true)
    private String email;

    @Column(unique = true, nullable = false)
    private String oAuth2Id;

    @Column(unique = true, nullable = false)
    private String nickname;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    @Enumerated(value = EnumType.STRING)
    private UserRole role;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private UserGender gender;

    private String address;

    private String profileImage;

    @Column(nullable = false)
    private UserStatus status;

    @Column(nullable = false)
    private String contact;
}
