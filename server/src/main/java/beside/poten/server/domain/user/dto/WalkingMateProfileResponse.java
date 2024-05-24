package beside.poten.server.domain.user.dto;

import beside.poten.server.domain.user.constant.WalkingMatePreferredDogSize;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
public class WalkingMateProfileResponse {

    private Long walkingMateId;

    private String experience;

    private WalkingMatePreferredDogSize preferredDogSize;

    private Timestamp preferredWalkingStartTime;

    private Timestamp preferredWalkingEndTime;

    private String preferredLocation;

    private String preferredPosition;

    private Integer maxDogs;

    private String profileImage;
}
