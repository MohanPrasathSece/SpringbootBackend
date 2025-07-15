package com.example.deploy.controllers;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Hello {
    @GetMapping("/hello")
    public String helloTest(){

        return "Hello Test";
    }
}