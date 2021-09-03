package com.pmy.service;

import com.github.pagehelper.PageInfo;
import com.pmy.pojo.User;

import java.util.List;

public interface UserService {

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    User login(String username, String password);

    /**
     * 用户注册
     * @param username
     * @param password
     * @return
     */
    boolean register(String username, String password);

    /**
     * 添加用户
     * @param user
     */
    void addUser(User user);

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    User updateUserInfo(User user);

    /**
     * 根据用户id查询用户信息
     * @param userId
     * @return
     */
    User getUserInfo(Integer userId);

    /**
     * 根据用户名查询用户信息
     * @param username
     * @return
     */
    User getUserInfo(String username);

    /**
     * 分页查询用户
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo finUserByPage(Integer pageNum, Integer pageSize);


    PageInfo findUserAll();

    /**
     * 山粗用户
     * @param id
     */
    void deleteUserById(Integer id);

}
