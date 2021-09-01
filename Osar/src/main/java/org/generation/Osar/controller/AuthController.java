package org.generation.Osar.controller;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.generation.Osar.jwt.config.LoginData;
import org.generation.Osar.jwt.config.Token;
import org.generation.Osar.publications.Proyecto;
import org.generation.Osar.users.User;
import org.generation.Osar.users.UserRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import java.util.Calendar;
import java.util.Date;
import java.util.Optional;

@RestController
public class AuthController {

    private final UserRepository ur;

    public AuthController(UserRepository ur) {
        this.ur = ur;
    }

    @PostMapping("/login")
    public Token token (@RequestBody LoginData.loginData data) throws ServletException {
        Optional<User> userByName = ur.findUserByName(data.getUsername());
        if(userByName.isPresent()){


            if( (data.getUsername().equals(userByName.get().getFullName())) &&
                    (data.getPassword().equals(userByName.get().getPassword()))){
                return new Token(generateToken(data.getUsername()));
            }//if
            throw new ServletException("Invalid login Please check your credencials");
        }//if

        throw new ServletException("Invalid login. Please check your credentials.");

    }//login

    private String generateToken( String email )  {
        Calendar calendar = Calendar.getInstance();
        calendar.add( Calendar.HOUR, 10 );
        String secret = "OSAR-es-el-lugar";

        return Jwts.builder().setSubject( email ).claim( "role", "user" ).setIssuedAt( new Date() ).setExpiration(
                calendar.getTime() ).signWith( SignatureAlgorithm.HS256, secret ).compact();
    }//generateToken
}//authcontroller
