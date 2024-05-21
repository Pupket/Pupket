package beside.poten.server.domain.user.dto.request;


import jakarta.validation.constraints.Email;
import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SignUpReq {

    @Email
    private String Email;

    private String Password;

    private String name;

    private String nickname;

    private String address;


    private String contact;

    private String gender;



}
