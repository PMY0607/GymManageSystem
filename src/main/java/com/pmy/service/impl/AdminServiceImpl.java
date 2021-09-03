package com.pmy.service.impl;

import com.pmy.mapper.AdminMapper;
import com.pmy.pojo.Admin;
import com.pmy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin login(String username, String password) {
        return adminMapper.selectAdminByUsernameAndPassword(username,password);
    }

    @Override
    public Boolean register(String username, String password) {
        if(adminMapper.selectAdminByUsername(username)!=null){
            return false;
        }else{
            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setRegisterTime(new Date());
            admin.setRole(1);
            adminMapper.insertAdmin(admin);
            return true;
        }
    }

    @Override
    public Admin getAdminInfo(Integer id) {
        return adminMapper.selectAdminById(id);
    }

    @Override
    public Admin updateAdminInfo(Admin admin) {
        if(adminMapper.selectAdminById(admin.getId()) != null){        //判断是否存在该管理员
            adminMapper.updateAdmin(admin);                            //更新用户信息
            return adminMapper.selectAdminById(admin.getId());
        }
        return null;
    }
}
