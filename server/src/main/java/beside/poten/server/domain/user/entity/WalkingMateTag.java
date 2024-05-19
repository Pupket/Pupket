package beside.poten.server.domain.user.entity;

import jakarta.persistence.*;

@Entity
public class WalkingMateTag {
    @Id
    @Column(unique = true)
    @ManyToOne
    private WalkingMate walkingMateId;

    @ManyToOne
    private Tag tagId;
}
