package com.example.demo;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "Testing Spring Boot Deployment";
    }
     @GetMapping("/api/v1")
    public String test() {
        return "Testing api 2";
    }
}
