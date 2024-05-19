package beside.poten.server.domain.board.entity;

import beside.poten.server.domain.board.constant.BoardDeleted;
import beside.poten.server.domain.user.entity.User;
import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Board {
    @Id
    @GeneratedValue
    private Integer boardId;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private Date createdDate;

    private Date modifiedDate;

    @Column(nullable = false)
    private String walkingDog;

    private String pickupLocation;

    @Column(nullable = false)
    private Date walkingStartTime;

    @Column(nullable = false)
    private Date walkingEndTime;

    private String walkingLocationRecommended;

    @Column(nullable = false)
    private Integer fee;

    @Column(nullable = false)
    private String contact;

    @Column(nullable = false)
    private BoardDeleted deleted;

    @ManyToOne
    private User userId;
}
