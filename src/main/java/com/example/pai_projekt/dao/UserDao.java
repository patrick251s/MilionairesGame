package com.example.pai_projekt.dao;

import com.example.pai_projekt.entities.User;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface UserDao extends CrudRepository<User, Integer> {
    public User findByLogin(String login);

    public List<User> findTop10ByOrderByBestresultDesc();
}