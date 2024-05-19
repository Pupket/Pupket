package beside.poten.server.domain.user.repository;

import beside.poten.server.domain.user.constant.SocialType;
import beside.poten.server.domain.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);

    Optional<User> findBySocialTypeAndOauth2Id(SocialType socialType, String id);

}

