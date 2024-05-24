package beside.poten.server.domain.user.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QWalkingMate is a Querydsl query type for WalkingMate
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QWalkingMate extends EntityPathBase<WalkingMate> {

    private static final long serialVersionUID = 574906963L;

    public static final QWalkingMate walkingMate = new QWalkingMate("walkingMate");

    public final StringPath experience = createString("experience");

    public final NumberPath<Integer> maxDogs = createNumber("maxDogs", Integer.class);

    public final EnumPath<beside.poten.server.domain.user.constant.WalkingMatePreferredDogSize> preferredDogSize = createEnum("preferredDogSize", beside.poten.server.domain.user.constant.WalkingMatePreferredDogSize.class);

    public final StringPath preferredLocation = createString("preferredLocation");

    public final StringPath preferredPosition = createString("preferredPosition");

    public final DateTimePath<java.sql.Timestamp> preferredWalkingEndTime = createDateTime("preferredWalkingEndTime", java.sql.Timestamp.class);

    public final DateTimePath<java.sql.Timestamp> preferredWalkingStartTime = createDateTime("preferredWalkingStartTime", java.sql.Timestamp.class);

    public final StringPath profileImage = createString("profileImage");

    public final NumberPath<Long> walkingMateId = createNumber("walkingMateId", Long.class);

    public QWalkingMate(String variable) {
        super(WalkingMate.class, forVariable(variable));
    }

    public QWalkingMate(Path<? extends WalkingMate> path) {
        super(path.getType(), path.getMetadata());
    }

    public QWalkingMate(PathMetadata metadata) {
        super(WalkingMate.class, metadata);
    }

}

