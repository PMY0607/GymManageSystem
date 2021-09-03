package com.pmy.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pmy.mapper.UserMapper;
import com.pmy.pojo.User;
import com.pmy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        return  userMapper.selectUserByUsernameAndPassword(username, password);
    }

    @Override
    public boolean register(String username, String password) {
        if(userMapper.selectUserByUsername(username)!=null){              //存在用户，注册失败
            return false;
        }else{                                              //不存在用户，注册成功
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setRegisterTime(new Date());
            user.setVip(0);
            userMapper.insertUser(user);
            return true;
        }
    }

    @Override
    public void addUser(User user) {
        user.setRegisterTime(new Date());
        userMapper.insertUser(user);
    }

    @Override
    public User updateUserInfo(User user) {
        if(userMapper.selectUserById(user.getId()) != null){        //判断是否存在该用户
            userMapper.updateUser(user);                            //更新用户信息
            return userMapper.selectUserById(user.getId());
        }
        return null;
    }

    @Override
    public User getUserInfo(Integer userId) {
        return userMapper.selectUserById(userId);
    }

    @Override
    public User getUserInfo(String username) {
        return userMapper.selectUserByUsername(username);
    }

    @Override
    public PageInfo<User> finUserByPage(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list=  userMapper.selectAllUser();
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo findUserAll() {
        PageHelper.startPage(1,0);
        return new PageInfo(userMapper.selectAllUser());
    }

    @Override
    public void deleteUserById(Integer id) {
        userMapper.deleteUserById(id);
    }


}






























