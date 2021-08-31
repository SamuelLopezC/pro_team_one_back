package org.generation.Osar.users;

import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    public final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    } // ends constructor

    public User getUser(Long idUser) {
        return userRepository.findById(idUser).orElseThrow(
                () -> new IllegalStateException("User does not exists " + idUser));
    } // ends getUsers method

    public void addUser(User usr) {
        Optional<User> userByName = userRepository.findUserByName(usr.getFullName());
        if (userByName.isPresent()) {
            throw new IllegalStateException("El nombre de usuario ya existe!");
        } // ends if
        else {
            userRepository.save(usr);
        } // ends else
    } // ends addUser method
} // ends UserService class
