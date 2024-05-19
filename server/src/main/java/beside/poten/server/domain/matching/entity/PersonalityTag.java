package beside.poten.server.domain.matching.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class PersonalityTag {
    @Id
    @GeneratedValue
    private Integer personalityTagId;

    @Column(nullable = false)
    private String tagName;
}
