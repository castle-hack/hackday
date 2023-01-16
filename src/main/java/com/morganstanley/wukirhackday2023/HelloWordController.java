package com.morganstanley.wukirhackday2023;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWordController
{
 @GetMapping("rest/helloworld")
    public String helloWorld(){
     return "Hello World! This is a test of Spring boot Rest";
 }
}
