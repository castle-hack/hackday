package com.morganstanley.spring.config.client.controller;

import com.morganstanley.spring.config.client.model.PropertiesResponse;
import com.morganstanley.spring.config.client.properties.SpringConfigProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.awt.*;
@RestController
public class SpringConfigController {
    @Value("${spring.profiles.active:default}")
    private String activeProfile;
    private final SpringConfigProperties properties;
    @Autowired
    public SpringConfigController(final SpringConfigProperties properties){
        this.properties = properties;
    }

    @GetMapping(value = "/greeting")
    public PropertiesResponse greeting() {
        return PropertiesResponse.builder()
                .profile(activeProfile)
                .greeting(properties.getGreeting())
                .build();
    }
}
