package com.astotal.crud.service;

import com.astotal.crud.dao.UserDao;
import com.astotal.crud.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addOrUpdateUser(User user) {
        if (user.getId() == null) {
            this.userDao.addUser(user);
        } else {
            this.userDao.updateUser(user);
        }
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<User> listUsers() {
        return this.userDao.listUsers();
    }

    @Override
    @Transactional
    public List<User> listUsersByPage(int page, int size) {
        return this.userDao.listUsersByPage(page, size);
    }

    @Override
    @Transactional
    public List<User> searchUser(String searchBy, String searchString) {
        return this.userDao.searchUser(searchBy, searchString);
    }
}
