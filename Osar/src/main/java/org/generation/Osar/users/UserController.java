package org.generation.Osar.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="/api/user/")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    } // ends constructor

    @GetMapping(path="{idUser}")
    public User loginUser(@PathVariable("idUser") Long idUser) {
        return userService.getUser(idUser);
    } // ends loginUser method (sign in)

    @PostMapping
    public void signUser(@RequestBody User usr) {
        userService.addUser(usr);
    } // ends signUser method (sign up)

    //@PostMapping
} // ends UserController class
