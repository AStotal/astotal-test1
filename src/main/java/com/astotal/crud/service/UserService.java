package com.astotal.crud.service;

import com.astotal.crud.model.User;

import java.util.List;

public interface UserService {
    public void addOrUpdateUser(User user);

    public void removeUser(int id);

    public User getUserById(int id);

    public List<User> listUsers();

    public List<User> listUsersByPage(int page, int size);

    public List<User> searchUser(String searchBy, String searchString);
}
