package com.lc.courseonline;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.lc"})
public class CourseonlineApplication {

    public static void main(String[] args) {
        SpringApplication.run(CourseonlineApplication.class, args);
    }

}
