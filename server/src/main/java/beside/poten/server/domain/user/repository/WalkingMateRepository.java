package beside.poten.server.domain.user.repository;

import beside.poten.server.domain.user.entity.WalkingMate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface WalkingMateRepository extends JpaRepository<WalkingMate, Long> {
    Optional<WalkingMate> findById(Long id);

    void deleteById(Long id);
}