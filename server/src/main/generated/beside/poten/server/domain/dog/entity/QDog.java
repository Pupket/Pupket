package beside.poten.server.domain.dog.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QDog is a Querydsl query type for Dog
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QDog extends EntityPathBase<Dog> {

    private static final long serialVersionUID = 1330565894L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QDog dog = new QDog("dog");

    public final DateTimePath<java.util.Date> birthday = createDateTime("birthday", java.util.Date.class);

    public final NumberPath<Integer> dogId = createNumber("dogId", Integer.class);

    public final EnumPath<beside.poten.server.domain.dog.constant.DogGender> gender = createEnum("gender", beside.poten.server.domain.dog.constant.DogGender.class);

    public final StringPath name = createString("name");

    public final EnumPath<beside.poten.server.domain.dog.constant.DogNeutered> neutered = createEnum("neutered", beside.poten.server.domain.dog.constant.DogNeutered.class);

    public final beside.poten.server.domain.matching.entity.QPersonalityTag personalityTagId;

    public final StringPath profileImage = createString("profileImage");

    public final StringPath specialNotes = createString("specialNotes");

    public final beside.poten.server.domain.user.entity.QUser userId;

    public final NumberPath<Long> weight = createNumber("weight", Long.class);

    public QDog(String variable) {
        this(Dog.class, forVariable(variable), INITS);
    }

    public QDog(Path<? extends Dog> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QDog(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QDog(PathMetadata metadata, PathInits inits) {
        this(Dog.class, metadata, inits);
    }

    public QDog(Class<? extends Dog> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.personalityTagId = inits.isInitialized("personalityTagId") ? new beside.poten.server.domain.matching.entity.QPersonalityTag(forProperty("personalityTagId")) : null;
        this.userId = inits.isInitialized("userId") ? new beside.poten.server.domain.user.entity.QUser(forProperty("userId")) : null;
    }

}

