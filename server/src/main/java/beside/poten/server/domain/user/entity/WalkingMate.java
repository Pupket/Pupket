package beside.poten.server.domain.user.entity;

import beside.poten.server.domain.user.constant.WalkingMatePreferredDogSize;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

import java.util.Date;

@Entity
public class WalkingMate {
    @Id
    @GeneratedValue
    private Integer walkingMateId;

    @Column(columnDefinition = "LONGTEXT", nullable = false)
    private String experience;

    @Column(nullable = false)
    private WalkingMatePreferredDogSize preferredDogSize;

    @Column(nullable = false)
    private Date preferredWalkingStartTime;

    @Column(nullable = false)
    private Date preferredWalkingEndTime;

    private String preferredLocation;

    private String preferredPosition;

    @Column(nullable = false)
    private Integer maxDogs;
    
    private String profileImage;
}
