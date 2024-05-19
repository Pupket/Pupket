package beside.poten.server.domain.user.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Vaccination {
    @Id
    @GeneratedValue
    private Integer vaccinationId;

    @ManyToOne
    private Dog dogId;

    @Column(nullable = false)
    private String vaccinationName;

    private Date vaccinatetionDate;
}
