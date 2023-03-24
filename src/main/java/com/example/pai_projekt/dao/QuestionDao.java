package com.example.pai_projekt.dao;

import com.example.pai_projekt.entities.Question;
import org.springframework.data.repository.CrudRepository;

public interface QuestionDao extends CrudRepository<Question, Integer>{
    public Question findById(int id);
}
