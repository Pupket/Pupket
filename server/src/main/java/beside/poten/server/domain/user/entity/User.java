package beside.poten.server.domain.user.entity;

import beside.poten.server.domain.user.constant.SocialType;
import beside.poten.server.domain.user.constant.UserGender;
import beside.poten.server.domain.user.constant.RoleType;
import beside.poten.server.domain.user.constant.UserStatus;
import beside.poten.server.global.superClass.entity.AbstractTimeStamp;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import static jakarta.persistence.GenerationType.IDENTITY;

@Entity
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class User extends AbstractTimeStamp {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;

    @Column(unique = true)
    private String email;

    @Column(unique = true)
    private String oauth2Id;

    @Column(unique = true)
    private String nickname;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    @Enumerated(value = EnumType.STRING)
    private RoleType role;

    private String name;

    @Enumerated(value = EnumType.STRING)
    private UserGender gender;

    private String address;

    private String profileImage;

    @Column(nullable = false)
    @Enumerated(value = EnumType.STRING)
    private UserStatus status;

    private String contact;

    private String refreshToken;

    @Enumerated(value = EnumType.STRING)
    private SocialType socialType;

    private LocalDate birthDay;

    public void updateRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public void encodePassword(PasswordEncoder password) {
        this.password = password.encode(this.password);
    }

    public void updateKakaoMember(String name, String nickname, String profileImage, String birthDay, String contact, String address, UserGender gender) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        this.name = name;
        this.nickname = nickname;
        this.profileImage = profileImage;
        this.birthDay = LocalDate.parse(birthDay,formatter);
        this.contact = contact;
        this.address = address;
        this.role = RoleType.USER;
        this.status = UserStatus.ACTIVE;
        this.gender = gender;

    }
    public void updateMember(String name, String nickname, String profileImage, String contact, String address) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        this.name = name;
        this.nickname = nickname;
        this.profileImage = profileImage;
        this.contact = contact;
        this.address = address;



    }

}
