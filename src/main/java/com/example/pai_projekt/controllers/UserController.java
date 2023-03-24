package com.example.pai_projekt.controllers;

import com.example.pai_projekt.dao.UserDao;
import com.example.pai_projekt.entities.User;
import java.security.Principal;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private UserDao dao;
    
    @GetMapping("/login")
    public String loginPage() {
        //zwrócenie nazwy widoku logowania - login.html
        return "login";
    }
    
    @GetMapping("/ranking")
    public String rankingPage() {
        return "ranking";
    }
    
    @GetMapping("/account")
    public String editPage(Model m, Principal principal) {
        m.addAttribute("user", dao.findByLogin(principal.getName()));
        return "account";
    }
    
    @PostMapping("/editPassword")
    public String editPassword(Principal principal, Model m, @RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("newPass2") String newPass2) {
        String loggedUserLogin = principal.getName();
        if(loggedUserLogin == null) {
            return "login";
        }
        User loggedUser = dao.findByLogin(loggedUserLogin);
        m.addAttribute("user", loggedUser);
        //Czy stare hasło jest poprawne z podanym starym hasłem, jeśli nie - zwracamy informację
        if(!passwordEncoder.matches(oldPass, loggedUser.getPassword())) {
            m.addAttribute("isOldPassNotCorrect", true);
            return "account";
        }
        if(newPass.length() < 6) {
            m.addAttribute("isPasswordLengthNotCorrect", true);
            return "account";
        }
        if(!newPass.equals(newPass2)) {
            m.addAttribute("isPasswordsNotTheSame", true);
            return "account";
        } 
        
        loggedUser.setPassword(passwordEncoder.encode(newPass));
        dao.save(loggedUser);
        m.addAttribute("changePassSuccess", true);
        return "account";
    }
    
    @PostMapping("/deleteUser")
    public String deleteUser(Principal principal) {
        dao.delete(dao.findByLogin(principal.getName()));
        return "redirect:/logout";
    }
    
    @GetMapping("/register")
    public String registerPage(Model m) {
        //dodanie do modelu nowego użytkownika
        m.addAttribute("user", new User());
        //zwrócenie nazwy widoku rejestracji - register.html
        return "register";
    }
    
    @PostMapping("/register")
    public String registerPagePOST(@Valid User user, BindingResult binding, Model m, @RequestParam("password2") String pass2) {
        if (binding.hasErrors()) {
            return "register"; //powrót do rejestracji
        }
        if(dao.findByLogin(user.getLogin()) != null) {
            m.addAttribute("errorLoginUnique", true);
            return "register";
        }
        if(!user.getPassword().equals(pass2)) {
            m.addAttribute("isPasswordsNotTheSame", true);
            return "register";
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setBestresult(0);
        dao.save(user);
        //przekierowanie do adresu url: /login
        return "redirect:/login";
    }
    
    @GetMapping("/game")
    public String gamePage(Model m, Principal principal) {
        //dodanie do modelu aktualnie zalogowanego użytkownika:
        m.addAttribute("user", dao.findByLogin(principal.getName()));
        return "game";
    } 
    
    @GetMapping("/users")
    public String getUsersList(Model m ) {
        m.addAttribute("usersList", dao.findAll());
        return "users";
    }
    
    @GetMapping("/logout")
    public String getUsersList(Principal p) {
        return "redirect:/login";
    }
}