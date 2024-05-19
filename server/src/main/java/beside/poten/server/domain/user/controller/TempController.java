package beside.poten.server.domain.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TempController {



    @GetMapping("/favicon.ico")
    public String tempController2() {
        return null;
    }
}
