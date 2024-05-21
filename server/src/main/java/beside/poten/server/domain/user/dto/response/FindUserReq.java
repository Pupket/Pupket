package beside.poten.server.domain.user.dto.response;

import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FindUserReq {


    private Long id;
    private String name;

    private String nickname;

    private String contact;

    private String gender;


}
