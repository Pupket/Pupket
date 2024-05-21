package beside.poten.server.domain.user.dto;

import beside.poten.server.domain.user.constant.UserGender;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SocialSignUpReq {

    private String name;

    private String nickname;

    private String gender;

    private String profileImage;

    private String contact;

    private String address;

    private String birthDay;
}
