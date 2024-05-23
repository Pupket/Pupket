package beside.poten.server.domain.dog.dto;

import beside.poten.server.domain.dog.constant.DogGender;
import beside.poten.server.domain.dog.constant.DogNeutered;
import lombok.Data;
import lombok.Getter;

import java.util.Date;

@Getter
@Data
public class DogProfileRequest {
    private String name;
    private DogGender gender;
    private DogNeutered neutered;
    private Date birthday;
    private Long weight;
    private String specialNotes;
    private String profileImage;
}
