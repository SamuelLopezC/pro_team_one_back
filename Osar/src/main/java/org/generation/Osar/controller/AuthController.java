package org.generation.Osar.controller;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.generation.Osar.jwt.config.LoginData;
import org.generation.Osar.jwt.config.Token;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import java.util.Calendar;
import java.util.Date;

@RestController
public class AuthController {
    @PostMapping("/login")
    public Token token (@RequestBody LoginData.loginData data) throws ServletException {
        if ( (data.getUsername().equals("slopez")) && (data.getPassword().equals("Pa$$w0rd")) ){
            return new Token(generateToken(data.getUsername()));
        }//if
        throw new ServletException("Invalid login Please check your credencials");
    }//login

    private String generateToken( String email )  {
        Calendar calendar = Calendar.getInstance();
        calendar.add( Calendar.HOUR, 10 );
        String secret = "this-secret-is-not-very-secret-99";

        return Jwts.builder().setSubject( email ).claim( "role", "user" ).setIssuedAt( new Date() ).setExpiration(
                calendar.getTime() ).signWith( SignatureAlgorithm.HS256, secret ).compact();
    }//generateToken
}//authcontroller
