package beside.poten.server.domain.matching.entity;

import beside.poten.server.domain.user.entity.Dog;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class DogPersonalityTag {
    @Id
    @ManyToOne
    private Dog dogId;

    @ManyToOne
    private PersonalityTag personalityTagId;
}
