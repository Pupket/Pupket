package beside.poten.server.domain.board.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QBoard is a Querydsl query type for Board
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QBoard extends EntityPathBase<Board> {

    private static final long serialVersionUID = 979347462L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QBoard board = new QBoard("board");

    public final NumberPath<Integer> boardId = createNumber("boardId", Integer.class);

    public final StringPath contact = createString("contact");

    public final DateTimePath<java.util.Date> createdDate = createDateTime("createdDate", java.util.Date.class);

    public final EnumPath<beside.poten.server.domain.board.constant.BoardDeleted> deleted = createEnum("deleted", beside.poten.server.domain.board.constant.BoardDeleted.class);

    public final NumberPath<Integer> fee = createNumber("fee", Integer.class);

    public final DateTimePath<java.util.Date> modifiedDate = createDateTime("modifiedDate", java.util.Date.class);

    public final StringPath pickupLocation = createString("pickupLocation");

    public final StringPath title = createString("title");

    public final beside.poten.server.domain.user.entity.QUser userId;

    public final StringPath walkingDog = createString("walkingDog");

    public final DateTimePath<java.util.Date> walkingEndTime = createDateTime("walkingEndTime", java.util.Date.class);

    public final StringPath walkingLocationRecommended = createString("walkingLocationRecommended");

    public final DateTimePath<java.util.Date> walkingStartTime = createDateTime("walkingStartTime", java.util.Date.class);

    public QBoard(String variable) {
        this(Board.class, forVariable(variable), INITS);
    }

    public QBoard(Path<? extends Board> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QBoard(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QBoard(PathMetadata metadata, PathInits inits) {
        this(Board.class, metadata, inits);
    }

    public QBoard(Class<? extends Board> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.userId = inits.isInitialized("userId") ? new beside.poten.server.domain.user.entity.QUser(forProperty("userId")) : null;
    }

}

