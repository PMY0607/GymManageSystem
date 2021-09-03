package com.pmy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
//    公共属性
    private Integer id;
    private String username;
    private String password;
    private String name;
    private Integer gender;
    private String tel;             //电话号码
    private String headPic;         //头像路径
    private Date registerTime;      //注册时间

//    会员属性
    private Integer vip;            //会员等级 0：普通用户 1：球场会员
    private BigDecimal balance;     //账户余额
    private Integer points;         //积分

}
