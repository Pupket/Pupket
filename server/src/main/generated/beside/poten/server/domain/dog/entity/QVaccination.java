package beside.poten.server.domain.dog.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QVaccination is a Querydsl query type for Vaccination
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QVaccination extends EntityPathBase<Vaccination> {

    private static final long serialVersionUID = 1831471631L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QVaccination vaccination = new QVaccination("vaccination");

    public final QDog dogId;

    public final DateTimePath<java.util.Date> vaccinatetionDate = createDateTime("vaccinatetionDate", java.util.Date.class);

    public final NumberPath<Integer> vaccinationId = createNumber("vaccinationId", Integer.class);

    public final StringPath vaccinationName = createString("vaccinationName");

    public QVaccination(String variable) {
        this(Vaccination.class, forVariable(variable), INITS);
    }

    public QVaccination(Path<? extends Vaccination> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QVaccination(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QVaccination(PathMetadata metadata, PathInits inits) {
        this(Vaccination.class, metadata, inits);
    }

    public QVaccination(Class<? extends Vaccination> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.dogId = inits.isInitialized("dogId") ? new QDog(forProperty("dogId"), inits.get("dogId")) : null;
    }

}

