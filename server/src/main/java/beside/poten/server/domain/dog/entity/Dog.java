package beside.poten.server.domain.dog.entity;

import beside.poten.server.domain.matching.entity.PersonalityTag;
import beside.poten.server.domain.dog.constant.DogGender;
import beside.poten.server.domain.dog.constant.DogNeutered;
import beside.poten.server.domain.user.entity.User;
import jakarta.persistence.*;

import java.util.Date;

import static jakarta.persistence.FetchType.*;
import static jakarta.persistence.GenerationType.*;

@Entity
public class Dog {
    @Id
    @GeneratedValue(strategy = IDENTITY)
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

    @ManyToOne(fetch = LAZY)
    private User userId;

    @ManyToOne(fetch = LAZY)
    private PersonalityTag personalityTagId;
}
