package com.spring.mart.controllers;

import com.spring.mart.model.HealthResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/health")
public class HealthController {
    @GetMapping
    public ResponseEntity<Object> getApplicationHealth() {
        return ResponseEntity.ok().body(new HealthResponse("App is up and running",200));
    }
}