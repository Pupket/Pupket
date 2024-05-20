package beside.poten.server.global.superClass.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QAbstractTimeStamp is a Querydsl query type for AbstractTimeStamp
 */
@Generated("com.querydsl.codegen.DefaultSupertypeSerializer")
public class QAbstractTimeStamp extends EntityPathBase<AbstractTimeStamp> {

    private static final long serialVersionUID = 500276310L;

    public static final QAbstractTimeStamp abstractTimeStamp = new QAbstractTimeStamp("abstractTimeStamp");

    public final DateTimePath<java.time.LocalDateTime> createdDate = createDateTime("createdDate", java.time.LocalDateTime.class);

    public final EnumPath<beside.poten.server.global.superClass.constant.AbstractFactoryDeleted> isDeleted = createEnum("isDeleted", beside.poten.server.global.superClass.constant.AbstractFactoryDeleted.class);

    public final DateTimePath<java.time.LocalDateTime> lastModified = createDateTime("lastModified", java.time.LocalDateTime.class);

    public QAbstractTimeStamp(String variable) {
        super(AbstractTimeStamp.class, forVariable(variable));
    }

    public QAbstractTimeStamp(Path<? extends AbstractTimeStamp> path) {
        super(path.getType(), path.getMetadata());
    }

    public QAbstractTimeStamp(PathMetadata metadata) {
        super(AbstractTimeStamp.class, metadata);
    }

}

