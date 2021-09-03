package com.pmy.controller;

import com.pmy.util.LoadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/file")
public class FileController {

    @RequestMapping("/showPic")
    public void showHeadPic(String path,  HttpServletResponse resp){
        LoadUtil.showPhoto(path,resp);
    }
}
