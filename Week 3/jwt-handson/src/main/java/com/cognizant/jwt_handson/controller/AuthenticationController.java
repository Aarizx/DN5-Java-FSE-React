package com.cognizant.jwt_handson.controller;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.jwt_handson.model.JwtResponse;
import com.cognizant.jwt_handson.util.JwtUtil;

@RestController
public class AuthenticationController {

    @GetMapping("/authenticate")
    public JwtResponse authenticate(
            @RequestHeader("Authorization") String authHeader) {

        String encoded = authHeader.substring("Basic ".length());

        byte[] decoded = Base64.getDecoder().decode(encoded);

        String credentials = new String(decoded, StandardCharsets.UTF_8);

        String username = credentials.split(":")[0];

        JwtUtil jwtUtil = new JwtUtil();

        String token = jwtUtil.generateToken(username);

        return new JwtResponse(token);
    }
}