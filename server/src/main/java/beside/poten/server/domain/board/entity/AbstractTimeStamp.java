package beside.poten.server.domain.board.entity;

import beside.poten.server.domain.board.constant.AbstractFactoryDeleted;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.util.Date;

@Entity
public class AbstractTimeStamp {
    @Id
    @Column(unique = true, nullable = false)
    private Date createdDate;

    @Column(nullable = false)
    private Date lastModified;

    @Column(nullable = false)
    private AbstractFactoryDeleted isDeleted;
}
