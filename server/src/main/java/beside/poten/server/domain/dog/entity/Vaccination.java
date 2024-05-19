package beside.poten.server.domain.dog.entity;

import jakarta.persistence.*;

import java.util.Date;

import static jakarta.persistence.GenerationType.IDENTITY;

@Entity
public class Vaccination {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Integer vaccinationId;

    @ManyToOne
    private Dog dogId;

    @Column(nullable = false)
    private String vaccinationName;

    private Date vaccinatetionDate;
}
