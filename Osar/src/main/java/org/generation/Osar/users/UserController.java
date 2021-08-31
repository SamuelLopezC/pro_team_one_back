package org.generation.Osar.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="api/user")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    } // ends constructor

    @GetMapping(path = "{userId}")
    public User loginUser(@PathVariable Long userId) {
        return userService.getUser(userId);
    } // ends loginUser method (sign in)

    @PostMapping
    public void signUser(@RequestBody User usr) {
        userService.addUser(usr);
    } // ends signUser method (sign up)

    //@PostMapping
}
