package beside.poten.server.domain.matching.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QDogPersonalityTag is a Querydsl query type for DogPersonalityTag
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QDogPersonalityTag extends EntityPathBase<DogPersonalityTag> {

    private static final long serialVersionUID = 1722918571L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QDogPersonalityTag dogPersonalityTag = new QDogPersonalityTag("dogPersonalityTag");

    public final beside.poten.server.domain.dog.entity.QDog dogId;

    public final QPersonalityTag personalityTagId;

    public QDogPersonalityTag(String variable) {
        this(DogPersonalityTag.class, forVariable(variable), INITS);
    }

    public QDogPersonalityTag(Path<? extends DogPersonalityTag> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QDogPersonalityTag(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QDogPersonalityTag(PathMetadata metadata, PathInits inits) {
        this(DogPersonalityTag.class, metadata, inits);
    }

    public QDogPersonalityTag(Class<? extends DogPersonalityTag> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.dogId = inits.isInitialized("dogId") ? new beside.poten.server.domain.dog.entity.QDog(forProperty("dogId"), inits.get("dogId")) : null;
        this.personalityTagId = inits.isInitialized("personalityTagId") ? new QPersonalityTag(forProperty("personalityTagId")) : null;
    }

}

