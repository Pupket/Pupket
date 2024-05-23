package beside.poten.server.domain.matching.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QPersonalityTag is a Querydsl query type for PersonalityTag
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QPersonalityTag extends EntityPathBase<PersonalityTag> {

    private static final long serialVersionUID = -1521089239L;

    public static final QPersonalityTag personalityTag = new QPersonalityTag("personalityTag");

    public final NumberPath<Integer> personalityTagId = createNumber("personalityTagId", Integer.class);

    public final StringPath tagName = createString("tagName");

    public QPersonalityTag(String variable) {
        super(PersonalityTag.class, forVariable(variable));
    }

    public QPersonalityTag(Path<? extends PersonalityTag> path) {
        super(path.getType(), path.getMetadata());
    }

    public QPersonalityTag(PathMetadata metadata) {
        super(PersonalityTag.class, metadata);
    }

}

