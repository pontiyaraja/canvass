package org.canvass.app.canvassapp.service;


import java.util.List;

import org.canvass.app.canvassapp.model.User;

public interface UserService {
    public void addUser(User user);
    public List<User> listUsers();
    public List<User> findUser(String email);
}