package com.example.pai_projekt.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id_user;
    
    @Column(unique=true)
    @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9]{2,19}$", message = "Proszę podaj login mający od 3 do 20 znaków alfanumerycznych i zaczynający się od litery")
    private String login;
    
    @Size(min = 6, message = "Proszę podaj hasło mające co najmniej 6 znaków")
    private String password;
    
    private Integer bestresult;    
} 