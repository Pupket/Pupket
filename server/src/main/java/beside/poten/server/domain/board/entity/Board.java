package beside.poten.server.domain.board.entity;

import beside.poten.server.domain.board.constant.BoardDeleted;
import beside.poten.server.domain.user.entity.User;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

import static jakarta.persistence.GenerationType.IDENTITY;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Integer boardId;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private LocalDateTime createdDate;

    private LocalDateTime modifiedDate;

    @Column(nullable = false)
    private String walkingDog;

    private String pickupLocation;

    @Column(nullable = false)
    private LocalDateTime walkingStartTime;

    @Column(nullable = false)
    private LocalDateTime walkingEndTime;

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
