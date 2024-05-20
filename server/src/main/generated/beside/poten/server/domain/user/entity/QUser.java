package beside.poten.server.domain.user.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QUser is a Querydsl query type for User
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QUser extends EntityPathBase<User> {

    private static final long serialVersionUID = 1906755382L;

    public static final QUser user = new QUser("user");

    public final beside.poten.server.global.superClass.entity.QAbstractTimeStamp _super = new beside.poten.server.global.superClass.entity.QAbstractTimeStamp(this);

    public final StringPath address = createString("address");

    public final DatePath<java.time.LocalDate> birthDay = createDate("birthDay", java.time.LocalDate.class);

    public final StringPath contact = createString("contact");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> createdDate = _super.createdDate;

    public final StringPath email = createString("email");

    public final EnumPath<beside.poten.server.domain.user.constant.UserGender> gender = createEnum("gender", beside.poten.server.domain.user.constant.UserGender.class);

    public final NumberPath<Long> id = createNumber("id", Long.class);

    //inherited
    public final EnumPath<beside.poten.server.global.superClass.constant.AbstractFactoryDeleted> isDeleted = _super.isDeleted;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> lastModified = _super.lastModified;

    public final StringPath name = createString("name");

    public final StringPath nickname = createString("nickname");

    public final StringPath oauth2Id = createString("oauth2Id");

    public final StringPath password = createString("password");

    public final StringPath profileImage = createString("profileImage");

    public final StringPath refreshToken = createString("refreshToken");

    public final EnumPath<beside.poten.server.domain.user.constant.RoleType> role = createEnum("role", beside.poten.server.domain.user.constant.RoleType.class);

    public final EnumPath<beside.poten.server.domain.user.constant.SocialType> socialType = createEnum("socialType", beside.poten.server.domain.user.constant.SocialType.class);

    public final EnumPath<beside.poten.server.domain.user.constant.UserStatus> status = createEnum("status", beside.poten.server.domain.user.constant.UserStatus.class);

    public QUser(String variable) {
        super(User.class, forVariable(variable));
    }

    public QUser(Path<? extends User> path) {
        super(path.getType(), path.getMetadata());
    }

    public QUser(PathMetadata metadata) {
        super(User.class, metadata);
    }

}

