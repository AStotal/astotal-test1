package com.astotal.crud.dao;

import com.astotal.crud.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.StringJoiner;

@Repository
public class UserDaoImpl implements UserDao {
    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User added to database. Details: " + user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User successfully updated. Details: " + user);
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        logger.info("User found. Details: " + user);
        return user;
    }

    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
//        User user = (User) session.load(User.class, id);
        User user = (User) session.get(User.class, id);
        if (user != null) {
            session.delete(user);
        }
        logger.info("User successfully deleted. Details: " + user);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("FROM User").list();

        for (User user : userList) {
            logger.info("User list: " + user);
        }
        return userList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsersByPage(int page, int size) {
        Session session = this.sessionFactory.getCurrentSession();
        Query q = session.createQuery("FROM User");
        q.setFirstResult((page - 1) * size);
        q.setMaxResults(size);
        List<User> userList = q.list();

        for (User user : userList) {
            logger.info("User list: " + user);
        }
        return userList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> searchUser(String searchBy, String searchString) {
        Session session = this.sessionFactory.getCurrentSession();
        String query;
        switch (searchBy) {
            case "older":
                query = String.format("FROM User WHERE age>%s", searchString); break;
            case "younger":
                query = String.format("FROM User WHERE age<%s", searchString); break;
            default:
                query = String.format("FROM User WHERE %s='%s'", searchBy, searchString);
        }

        Query q = session.createQuery(query);
        List<User> userList = q.list();

        for (User user : userList) {
            logger.info("User list: " + user);
        }

        return userList;
    }
}
