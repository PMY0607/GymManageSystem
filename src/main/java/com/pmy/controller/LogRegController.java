package com.pmy.controller;

import com.pmy.pojo.User;
import com.pmy.service.AdminService;
import com.pmy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LogRegController {
    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    @RequestMapping("logout")
    public ModelAndView logOut(HttpServletRequest req, ModelAndView mv){
        HttpSession session = req.getSession();
        session.removeAttribute("userId");
        session.removeAttribute("adminId");
        mv.clear();
        mv.setViewName("redirect:/toLogin");
        return mv;
    }

    @RequestMapping("toLogin")
    public ModelAndView toLogin(HttpSession session,ModelAndView mv){
            mv.addObject("msg",mv.getModel().get("msg"));
            mv.setViewName("login");
            return mv;
    }

    @RequestMapping("toRegister")
    public ModelAndView toRegister(ModelAndView mv){
        mv.setViewName("register");
        return mv;
    }


}
