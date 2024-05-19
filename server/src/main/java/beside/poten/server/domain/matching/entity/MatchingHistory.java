package beside.poten.server.domain.matching.entity;

import beside.poten.server.domain.board.constant.MatchingHistoryCancelled;
import beside.poten.server.domain.board.entity.Board;
import beside.poten.server.domain.user.entity.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class MatchingHistory {
    @Id
    @ManyToOne
    private User userId;

    @ManyToOne
    private Board boardCreatorId;

    @Column(nullable = false)
    private MatchingHistoryCancelled cancelled;
}
