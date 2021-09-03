package com.pmy.mapper;

import com.pmy.pojo.Admin;
import org.apache.ibatis.annotations.*;


public interface AdminMapper {

    @Select("select * from admin where id = #{id}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "name",property = "name"),
            @Result(column = "gender",property = "gender"),
            @Result(column = "tel",property = "tel"),
            @Result(column = "head_pic",property = "headPic"),
            @Result(column = "register_time",property = "registerTime"),
            @Result(column = "role",property = "role")
    })
        //根据id查询管理员
    Admin selectAdminById(Integer id);

    @Select("select * from admin where username=#{username} ")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "name",property = "name"),
            @Result(column = "gender",property = "gender"),
            @Result(column = "tel",property = "tel"),
            @Result(column = "head_pic",property = "headPic"),
            @Result(column = "register_time",property = "registerTime"),
            @Result(column = "role",property = "role")
    })
        //根据用户名查询管理员
    Admin selectAdminByUsername(@Param("username") String username);

    @Select("select * from admin where username=#{username} and password=#{password} ")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "name",property = "name"),
            @Result(column = "gender",property = "gender"),
            @Result(column = "tel",property = "tel"),
            @Result(column = "head_pic",property = "headPic"),
            @Result(column = "register_time",property = "registerTime"),
            @Result(column = "role",property = "role")
    })
        //根据用户名密码查询管理员
    Admin selectAdminByUsernameAndPassword(@Param("username") String username,@Param("password") String password);

    @Insert(
      "<script>\n"
          + "            insert into admin\n"
          + "            <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">\n"
          + "                <if test=\"id != null\">\n"
          + "                    id,\n"
          + "                </if>\n"
          + "                <if test=\"username != null\">\n"
          + "                    username,\n"
          + "                </if>\n"
          + "                <if test=\"password != null\">\n"
          + "                    password,\n"
          + "                </if>\n"
          + "                <if test=\"name != null\">\n"
          + "                    name,\n"
          + "                </if>\n"
          + "                <if test=\"gender != null\">\n"
          + "                    gender,\n"
          + "                </if>\n"
          + "                <if test=\"tel != null\">\n"
          + "                    tel,\n"
          + "                </if>\n"
          + "                <if test=\"headPic != null\">\n"
          + "                    head_pic,\n"
          + "                </if>\n"
          + "                <if test=\"registerTime != null\">\n"
          + "                    register_time,\n"
          + "                </if>\n"
          + "                <if test=\"role != null\">\n"
          + "                    role,\n"
          + "                </if>\n"
          + "            </trim>\n"
          + "            <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\">\n"
          + "                <if test=\"id != null\">\n"
          + "                    #{id},\n"
          + "                </if>\n"
          + "                <if test=\"username != null\">\n"
          + "                    #{username},\n"
          + "                </if>\n"
          + "                <if test=\"password != null\">\n"
          + "                    #{password},\n"
          + "                </if>\n"
          + "                <if test=\"name != null\">\n"
          + "                    #{name},\n"
          + "                </if>\n"
          + "                <if test=\"gender != null\">\n"
          + "                    #{gender},\n"
          + "                </if>\n"
          + "                <if test=\"tel != null\">\n"
          + "                    #{tel},\n"
          + "                </if>\n"
          + "                <if test=\"headPic != null\">\n"
          + "                    #{headPic},\n"
          + "                </if>\n"
          + "                <if test=\"registerTime != null\">\n"
          + "                    #{registerTime},\n"
          + "                </if>\n"
          + "                <if test=\"role != null\">\n"
          + "                    #{role},\n"
          + "                </if>\n"
          + "            </trim>\n"
          + "        </script>")
    @Options(useGeneratedKeys = true, keyColumn = "id", keyProperty = "id")
        // 插入管理员并返回id
    void insertAdmin(Admin admin);

    @Update(
      "<script>\n"
          + "\n"
          + " update  admin\n"
          + "\n"
          + "<trim prefix=\"set\" suffixOverrides=\",\">\n"
          + "  <if test=\"name!=null\">name=#{name},</if>\n"
          + "  <if test=\"password!=null\">password=#{password},</if>\n"
          + "  <if test=\"gender!=null\">gender=#{gender},</if>\n"
          + "  <if test=\"tel!=null\">tel=#{tel},</if>\n"
          + "  <if test=\"headPic!=null\">head_pic=#{headPic},</if>\n"
          + "  <if test=\"role!=null\">role=#{role},</if>\n"
          + " </trim>\n"
          + " where id=#{id}\n"
          + "\n"
          + "</script>\n"
          + "\n")
        // 更新管理员
    Integer updateAdmin(Admin admin);
}
