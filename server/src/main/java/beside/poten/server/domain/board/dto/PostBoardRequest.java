package beside.poten.server.domain.board.dto;

import beside.poten.server.domain.board.constant.BoardDeleted;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PostBoardRequest {
    private String title;

    private String walkingDog;

    private String pickupLocation;

    private LocalDateTime walkingStartTime;

    private LocalDateTime walkingEndTime;

    private String walkingLocationRecommended;

    private Integer fee;

    private String contact;

    private BoardDeleted deleted;
}
