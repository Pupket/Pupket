package beside.poten.server.domain.user.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UpdateReq {
    private String name;
    private String nickname;
    private String address;
    private String profileImage;
    private String contact;

}
