package beside.poten.server.domain.user.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QWalkingMateTag is a Querydsl query type for WalkingMateTag
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QWalkingMateTag extends EntityPathBase<WalkingMateTag> {

    private static final long serialVersionUID = -1276157881L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QWalkingMateTag walkingMateTag = new QWalkingMateTag("walkingMateTag");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final QTag tag;

    public final QWalkingMate walkingMate;

    public QWalkingMateTag(String variable) {
        this(WalkingMateTag.class, forVariable(variable), INITS);
    }

    public QWalkingMateTag(Path<? extends WalkingMateTag> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QWalkingMateTag(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QWalkingMateTag(PathMetadata metadata, PathInits inits) {
        this(WalkingMateTag.class, metadata, inits);
    }

    public QWalkingMateTag(Class<? extends WalkingMateTag> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.tag = inits.isInitialized("tag") ? new QTag(forProperty("tag")) : null;
        this.walkingMate = inits.isInitialized("walkingMate") ? new QWalkingMate(forProperty("walkingMate")) : null;
    }

}

