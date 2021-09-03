package com.pmy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin extends User{
    //    公共属性
    private Integer id;
    private String username;
    private String password;
    private String name;
    private Integer gender;
    private String tel;             //电话号码
    private String headPic;         //头像路径
    private Date registerTime;      //注册时间
    private Integer role;           //角色 暂且先定1为管理员  1:收银员 2:管理员
}
