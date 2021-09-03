package com.pmy.service;

import com.pmy.pojo.Admin;

public interface AdminService {

    /**
     * 管理员登录
     * @param username  用户名
     * @param password  密码
     * @return  管理员实例
     */
    Admin login(String username, String password);

    /**
     * 管理员注册
     * @param username 用户名
     * @param password  密码
     * @return  是否正确注册
     */
    Boolean register(String username,String password);

    /**
     * 根据管理员id获得管理员信息
     * @param id
     * @return
     */
    Admin getAdminInfo(Integer id);

    /**
     * 更新管理员信息
     * @param admin 新的管理员信息
     * @return
     */
    Admin updateAdminInfo(Admin admin);
}
