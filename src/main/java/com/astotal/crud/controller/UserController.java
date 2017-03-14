package com.astotal.crud.controller;

import com.astotal.crud.model.User;
import com.astotal.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("listUsers", this.userService.listUsers());
        return "users";
    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public String addOrUpdateUser(@ModelAttribute("userForm") @Valid User user, BindingResult br, Model model) {
        if (br.hasErrors()){
            return "userAddForm";
        } else {
            this.userService.addOrUpdateUser(user);
        }

        return "redirect:/users";
    }

    @RequestMapping(value = "/users/search", method = RequestMethod.GET)
    public String searchUser(@RequestParam(value = "searchString", required = false) String pSearchString,
                             @RequestParam(value = "searchBy") String pSearchBy, Model model) {
        if (pSearchString.isEmpty()) return listUsers(model);
        List<User> listUsers = this.userService.searchUser(pSearchBy, pSearchString);
        model.addAttribute("searchString", pSearchString);
        model.addAttribute("searchBy", pSearchBy);
        model.addAttribute("listUsers", listUsers);

        return "users";
    }

    @RequestMapping(value = "/users/page/{page}-{size}", method = RequestMethod.GET)
    public String addOrUpdateUser(@PathVariable("page") int page, @PathVariable("size") int size, Model model) {
        List<User> userList = this.userService.listUsersByPage(page, size);
        List<User> userListNextOne = this.userService.listUsersByPage(page + 1, 10);
        model.addAttribute("listUsers", userList);
        model.addAttribute("currentPage", page);
        model.addAttribute("hasUsers", userListNextOne.size() > 0);

        return "users";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String showAddUserForm(Model model) {
        model.addAttribute("userForm", new User());
        return "userAddForm";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);

        return "redirect:/users";
    }

    @RequestMapping("/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        model.addAttribute("userForm", this.userService.getUserById(id));

        return "userAddForm";
    }

    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));

        return "userdata";
    }
}
