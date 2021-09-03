package com.pmy.controller;


import com.pmy.pojo.Admin;
import com.pmy.pojo.Result;
import com.pmy.service.AdminService;
import com.pmy.util.LoadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping("/updateMyInfo")
    public ModelAndView updateUser(
            Admin admin, HttpServletRequest req,
            ModelAndView mv, MultipartFile pic){
        HttpSession session = req.getSession();
        Integer id = (Integer) session.getAttribute("adminId");
        admin.setId(id);

        if(pic.getSize() !=0 ) {
            String picPath = LoadUtil.upLoadHeadPic(pic);
            admin.setHeadPic(picPath);
        }

        Admin newAdmin = adminService.updateAdminInfo(admin);
        mv.addObject("admin",newAdmin);
        mv.setViewName("redirect:/admin/myInfo");
        return mv;
    }

    @RequestMapping("/myInfo")
    public ModelAndView adminInfo(HttpServletRequest req, ModelAndView mv){
        HttpSession session = req.getSession();
        Integer id = (Integer) session.getAttribute("adminId");
        Admin admin = adminService.getAdminInfo(id);
        mv.addObject("admin",admin);
        mv.setViewName("/admin/adminInfo");
        return  mv;
    }


    @RequestMapping("index")
    public ModelAndView goIndex(HttpServletRequest req, ModelAndView mv){
        Integer id = (Integer) req.getSession().getAttribute("adminId");
        Admin admin = adminService.getAdminInfo(id);
        mv.addObject("admin",admin);
        mv.setViewName("/admin/adminIndex");
        return mv;
    }

    @RequestMapping("/login")
    public String login(String username, String password, HttpServletRequest req){
        Admin admin = adminService.login(username, password);
        HttpSession session = req.getSession();
        if(!StringUtils.isEmpty(admin)){
            session.setAttribute("adminId",admin.getId());
            return "redirect:/admin/index";
        }else{
            return "redirect:/toLogin";
        }
    }

    @RequestMapping("/register")
    public ModelAndView register(String username,String password,ModelAndView mv){
        if(adminService.register(username, password)){
            mv.setViewName("redirect:/toLogin");
        }else{
            mv.addObject("msg","用户已存在!");
            mv.setViewName("register");
        }
        return mv;
    }

    @RequestMapping("/logout")
    public void logOut(HttpSession session){
        session.removeAttribute("adminId");
        session.removeAttribute("admin");
    }

    
}
