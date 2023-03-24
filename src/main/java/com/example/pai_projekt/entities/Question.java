package com.example.pai_projekt.entities;

import com.fasterxml.jackson.annotation.JsonView;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "questions")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    @JsonView
    private String content;
    
    @JsonView
    private String link;
    
    @JsonView
    private String answerA;
    
    @JsonView
    private String answerB;
    
    @JsonView
    private String answerC;
    
    @JsonView
    private String answerD;
    
    @JsonView
    private String correct;
    
    @JsonView
    private int id_category;
    
    @JsonView
    private int counterA;
    
    @JsonView
    private int counterB;
    
    @JsonView
    private int counterC;
    
    @JsonView
    private int counterD;
}
