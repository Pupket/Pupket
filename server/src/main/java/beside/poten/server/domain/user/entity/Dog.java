package beside.poten.server.domain.user.entity;

import beside.poten.server.domain.matching.entity.PersonalityTag;
import beside.poten.server.domain.user.constant.DogGender;
import beside.poten.server.domain.user.constant.DogNeutered;
import jakarta.persistence.*;

import java.util.Date;

@Entity
public class Dog {
    @Id
    @GeneratedValue
    @Column(unique = true)
    private Integer dogId;

    @Column(nullable = false)
    private String Name;

    @Column(nullable = false)
    private DogGender gender;

    @Column(nullable = false)
    private DogNeutered neutered;

    private Date birthday;

    private Long weight;

    @Column(columnDefinition = "LONGTEXT")
    private String specialNotes;

    private String profileImage;

    @ManyToOne
    private User userId;

    @ManyToOne
    private PersonalityTag personalityTagId;
}
