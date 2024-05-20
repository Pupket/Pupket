package beside.poten.server.domain.matching.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QMatchingHistory is a Querydsl query type for MatchingHistory
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QMatchingHistory extends EntityPathBase<MatchingHistory> {

    private static final long serialVersionUID = -1778917734L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QMatchingHistory matchingHistory = new QMatchingHistory("matchingHistory");

    public final beside.poten.server.domain.board.entity.QBoard boardCreatorId;

    public final EnumPath<beside.poten.server.domain.matching.constant.MatchingHistoryCancelled> cancelled = createEnum("cancelled", beside.poten.server.domain.matching.constant.MatchingHistoryCancelled.class);

    public final beside.poten.server.domain.user.entity.QUser userId;

    public QMatchingHistory(String variable) {
        this(MatchingHistory.class, forVariable(variable), INITS);
    }

    public QMatchingHistory(Path<? extends MatchingHistory> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QMatchingHistory(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QMatchingHistory(PathMetadata metadata, PathInits inits) {
        this(MatchingHistory.class, metadata, inits);
    }

    public QMatchingHistory(Class<? extends MatchingHistory> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.boardCreatorId = inits.isInitialized("boardCreatorId") ? new beside.poten.server.domain.board.entity.QBoard(forProperty("boardCreatorId"), inits.get("boardCreatorId")) : null;
        this.userId = inits.isInitialized("userId") ? new beside.poten.server.domain.user.entity.QUser(forProperty("userId")) : null;
    }

}

