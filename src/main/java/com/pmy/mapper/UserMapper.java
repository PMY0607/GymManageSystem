package com.pmy.mapper;

import com.pmy.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface UserMapper {

    @Select("select * from user where id = #{id}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "name",property = "name"),
            @Result(column = "gender",property = "gender"),
            @Result(column = "tel",property = "tel"),
            @Result(column = "head_pic",property = "headPic"),
            @Result(column = "register_time",property = "registerTime"),
            @Result(column = "vip",property = "vip"),
            @Result(column = "balance",property = "balance"),
            @Result(column = "points",property = "points")
    })
        //根据会员ID查询会员
    User selectUserById(Integer id);

    @Select("select * from user where username=#{username} ")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "name",property = "name"),
            @Result(column = "gender",property = "gender"),
            @Result(column = "tel",property = "tel"),
            @Result(column = "head_pic",property = "headPic"),
            @Result(column = "register_time",property = "registerTime"),
            @Result(column = "vip",property = "vip"),
            @Result(column = "balance",property = "balance"),
            @Result(column = "points",property = "points")
    })
        //根据会员账户查询会员
    User selectUserByUsername(@Param("username") String username);

    @Select("select * from user where username=#{username} and password=#{password} ")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "name",property = "name"),
            @Result(column = "gender",property = "gender"),
            @Result(column = "tel",property = "tel"),
            @Result(column = "head_pic",property = "headPic"),
            @Result(column = "register_time",property = "registerTime"),
            @Result(column = "vip",property = "vip"),
            @Result(column = "balance",property = "balance"),
            @Result(column = "points",property = "points")
    })
        //根据会员账户密码查询会员
    User selectUserByUsernameAndPassword(@Param("username") String username,@Param("password") String password);

    @Insert(
            "<script>\n"
                    + "        insert into user\n"
                    + "        <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">\n"
                    + "            <if test=\"id != null\">\n"
                    + "                id,\n"
                    + "            </if>\n"
                    + "            <if test=\"username != null\">\n"
                    + "                username,\n"
                    + "            </if>\n"
                    + "            <if test=\"password != null\">\n"
                    + "                password,\n"
                    + "            </if>\n"
                    + "            <if test=\"name != null\">\n"
                    + "                name,\n"
                    + "            </if>\n"
                    + "            <if test=\"gender != null\">\n"
                    + "                gender,\n"
                    + "            </if>\n"
                    + "            <if test=\"tel != null\">\n"
                    + "                tel,\n"
                    + "            </if>\n"
                    + "            <if test=\"headPic != null\">\n"
                    + "                head_pic,\n"
                    + "            </if>\n"
                    + "            <if test=\"registerTime != null\">\n"
                    + "                 register_time,\n"
                    + "            </if>\n"
                    + "            <if test=\"vip != null\">\n"
                    + "                vip,\n"
                    + "            </if>\n"
                    + "            <if test=\"balance != null\">\n"
                    + "                balance,\n"
                    + "            </if>\n"
                    + "            <if test=\"points != null\">\n"
                    + "                points,\n"
                    + "            </if>\n"
                    + "        </trim>\n"
                    + "        <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\">\n"
                    + "            <if test=\"id != null\">\n"
                    + "                #{id},\n"
                    + "            </if>\n"
                    + "            <if test=\"username != null\">\n"
                    + "                #{username},\n"
                    + "            </if>\n"
                    + "            <if test=\"password != null\">\n"
                    + "                #{password},\n"
                    + "            </if>\n"
                    + "            <if test=\"name != null\">\n"
                    + "                #{name},\n"
                    + "            </if>\n"
                    + "            <if test=\"gender != null\">\n"
                    + "                #{gender},\n"
                    + "            </if>\n"
                    + "            <if test=\"tel != null\">\n"
                    + "                #{tel},\n"
                    + "            </if>\n"
                    + "            <if test=\"headPic != null\">\n"
                    + "                #{headPic},\n"
                    + "            </if>\n"
                    + "            <if test=\"registerTime != null\">\n"
                    + "                #{registerTime},\n"
                    + "            </if>\n"
                    + "            <if test=\"vip != null\">\n"
                    + "                #{vip},\n"
                    + "            </if>\n"
                    + "            <if test=\"balance != null\">\n"
                    + "                #{balance},\n"
                    + "            </if>\n"
                    + "            <if test=\"points != null\">\n"
                    + "                #{points},\n"
                    + "            </if>\n"
                    + "        </trim>\n"
                    + "    </script>   ")
    @Options(useGeneratedKeys = true,keyColumn = "id",keyProperty = "id")
        //插入会员并返回id
    void insertUser(User User);

    @Update(
            "<script>\n"
                    + "\n"
                    + " update  user\n"
                    + "\n"
                    + "<trim prefix=\"set\" suffixOverrides=\",\">\n"
                    + "  <if test=\"name!=null\">name=#{name},</if>\n"
                    + "  <if test=\"password!=null\">password=#{password},</if>\n"
                    + "  <if test=\"gender!=null\">gender=#{gender},</if>\n"
                    + "  <if test=\"tel!=null\">tel=#{tel},</if>\n"
                    + "  <if test=\"headPic!=null\">head_pic=#{headPic},</if>\n"
                    + "  <if test=\"vip!=null\">vip=#{vip},</if>\n"
                    + "  <if test=\"balance!=null\">balance=#{balance},</if>\n"
                    + "  <if test=\"points!=null\">points=#{points},</if>\n"
                    + " </trim>\n"
                    + " where id=#{id}\n"
                    + "\n"
                    + "</script>\n"
                    + "\n")
        // 更新用户
    Integer updateUser(User user);

    @Select("select * from user")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "name",property = "name"),
            @Result(column = "gender",property = "gender"),
            @Result(column = "tel",property = "tel"),
            @Result(column = "head_pic",property = "headPic"),
            @Result(column = "register_time",property = "registerTime"),
            @Result(column = "vip",property = "vip"),
            @Result(column = "balance",property = "balance"),
            @Result(column = "points",property = "points")
    })
        //根据会员ID查询会员
    List<User> selectAllUser();

    @Delete("delete from user where id=#{id}")
    //删除用户
    void deleteUserById(Integer id);
}
