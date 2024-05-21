package beside.poten.server.domain.user.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SocialSignUpReq {

    private String name;

    private String nickname;

    private String gender;


    private String contact;

    private String address;

    private String birthDay;
}
