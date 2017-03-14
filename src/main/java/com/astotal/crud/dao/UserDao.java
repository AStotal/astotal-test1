package com.astotal.crud.dao;

import com.astotal.crud.model.User;

import java.util.List;

public interface UserDao {
    public void addUser(User user);

    public void updateUser(User user);

    public void removeUser(int id);

    public User getUserById(int id);

    public List<User> listUsers();

    public List<User> listUsersByPage(int page, int size);

    List<User> searchUser(String searchBy, String searchString);
}
