package beside.poten.server.global.jwt.repository;

import beside.poten.server.global.jwt.entity.Token;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TokenRepository extends JpaRepository<Token, Long> {
}
