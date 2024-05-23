package beside.poten.server.global.superClass.entity;

import beside.poten.server.global.superClass.constant.AbstractFactoryDeleted;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;

import java.time.LocalDateTime;

@MappedSuperclass
@Getter
public class AbstractTimeStamp {
    private LocalDateTime createdDate;

    private LocalDateTime lastModified;

    private AbstractFactoryDeleted isDeleted;

    public void updateLastModifed() {
        this.lastModified = LocalDateTime.now();
    }

    public void updateCreateDate() {
        createdDate = LocalDateTime.now();
    }

    public void updateIsDeleted(String isDeleted) {
        this.isDeleted = AbstractFactoryDeleted.valueOf(isDeleted);
    }



}
