package beside.poten.server.domain.matching;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class test {

    @GetMapping("/test")
    public String hello(){
        return "hello";
    }

}
