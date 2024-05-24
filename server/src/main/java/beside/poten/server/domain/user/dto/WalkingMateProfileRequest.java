package beside.poten.server.domain.user.dto;

import beside.poten.server.domain.user.constant.WalkingMatePreferredDogSize;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@ToString
public class WalkingMateProfileRequest {

    private String experience;

    private WalkingMatePreferredDogSize preferredDogSize;

    private Timestamp preferredWalkingStartTime;

    private Timestamp preferredWalkingEndTime;

    private String preferredLocation;

    private String preferredPosition;

    private Integer maxDogs;

    private String profileImage;
}
