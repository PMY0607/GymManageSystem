package com.pmy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pmy.pojo.Admin;
import com.pmy.pojo.Result;
import com.pmy.pojo.User;
import com.pmy.service.UserService;
import com.pmy.util.LoadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;


    @RequestMapping("/userIsExist")
    @ResponseBody
    public Result userIsExist(String username){
        return userService.getUserInfo(username)!=null?Result.error("1","用户名已存在!"):Result.success();
    }

    @RequestMapping("/addUser")
    public String addUser(User user){
        userService.addUser(user);
        return "/admin/userList";
    }

    @RequestMapping("/delUserById")
    public void delUser(Integer id){
       userService.deleteUserById(id);
    }

    @RequestMapping("/updateUser")
    public String updateUserInfo(User user){
        userService.updateUserInfo(user);
        return "admin/userList";
    }

    @RequestMapping("/toUserList")
    public String toUserList(){
        return "/admin/userList";
    }

    @RequestMapping("/userList")
    @ResponseBody
    public Result userList(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10")Integer pageSize){

        PageInfo pageInfo = userService.finUserByPage(pageNum, pageSize);
        return Result.success(pageInfo);
    }

    @RequestMapping("/updateMyInfo")
    public ModelAndView updateMyInfo(
            User user, HttpServletRequest req,
            ModelAndView mv, MultipartFile pic){
        HttpSession session = req.getSession();
        Integer id = (Integer) session.getAttribute("userId");
        user.setId(id);

        if(pic.getSize() !=0 ) {
            String picPath = LoadUtil.upLoadHeadPic(pic);
            user.setHeadPic(picPath);
        }
        User newUser = userService.updateUserInfo(user);
        mv.addObject("user",newUser);
        mv.setViewName("user/userInfo");
        return mv;
    }

    @RequestMapping("/myInfo")
    public ModelAndView userInfo(HttpSession session, ModelAndView mv){
        Integer id = (Integer) session.getAttribute("userId");
        User user = userService.getUserInfo(id);
        mv.addObject("user",user);
        mv.setViewName("user/userInfo");
        return mv;
    }

    @RequestMapping("index")
    public ModelAndView goIndex(HttpServletRequest req, ModelAndView mv){
        Integer id = (Integer) req.getSession().getAttribute("userId");
        User user = userService.getUserInfo(id);
        mv.addObject("user",user);
        mv.setViewName("/user/userIndex");
        return mv;
    }

    @RequestMapping("/login")
    public ModelAndView login(String username, String password, ModelAndView mv,HttpSession session){
            User user = userService.login(username, password);
            if(!StringUtils.isEmpty(user)){
                session.setAttribute("userId",user.getId());
                mv.setViewName("redirect:/user/index");
            }else{
                mv.addObject("msg","用户名密码错误");
                mv.setViewName("redirect:/toLogin");
            }
            return mv;
    }

    @RequestMapping("/register")
    public ModelAndView register(String username,String password,ModelAndView mv){
        if(userService.register(username, password)){
            mv.setViewName("redirect:/toLogin");
        }else{
            mv.addObject("msg","该用户已存在!");
            mv.setViewName("/register");
        }
        return mv;
    }

    @RequestMapping("/logout")
    public void logOut(HttpSession session){
        session.removeAttribute("userId");
        session.removeAttribute("user");
    }

    @RequestMapping("/test")
    public void TestInsertUser(){
        for(int i=0;i<20 ;i++){
            User user = new User();
            user.setUsername("testUser"+i);
            user.setPassword("testUser"+i);
            user.setName("testUser"+i);
            user.setGender(i%2==1?1:0);
            user.setTel(String.format("18173472%02d",i));
            user.setHeadPic("E:/projectPractice/GymManageSystem/src/main/webapp/img/testHeadPic.jpeg");
            userService.addUser(user);
        }
    }

}
