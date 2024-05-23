package beside.poten.server.domain.dog.repository;

import beside.poten.server.domain.dog.entity.Dog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DogRepository extends JpaRepository<Dog, Integer> {
    Dog findByDogId(Long id);

    void deleteByDogId(Long id);
}