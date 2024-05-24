package beside.poten.server.domain.user.entity;

import beside.poten.server.domain.user.constant.WalkingMatePreferredDogSize;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class WalkingMate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "walking_mate_id")
    private Long walkingMateId;

    @Column(columnDefinition = "LONGTEXT", nullable = false)
    private String experience;

    @Column(nullable = false)
    private WalkingMatePreferredDogSize preferredDogSize;

    @Column(nullable = false)
    private Timestamp preferredWalkingStartTime;

    @Column(nullable = false)
    private Timestamp preferredWalkingEndTime;

    private String preferredLocation;

    private String preferredPosition;

    @Column(nullable = false)
    private Integer maxDogs;

    private String profileImage;
}
