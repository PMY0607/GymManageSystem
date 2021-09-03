package com.pmy.service;

import com.github.pagehelper.PageInfo;
import com.pmy.pojo.BookInfo;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface BookService {

    /**
     * 预定场地
     * @param uid 用户id
     * @param pid   场地id
     * @param startTime 开始时间
     * @param count 数量
     * @param note 备注
     */
    void bookPlace(Integer uid,Integer pid,Date startTime,Integer count,String note);

    /**
     * 分页根据用户id获取预定信息
     * @param uid   用户id
     * @param pageNum   页号
     * @param pageSize  页大小
     * @param mohu  模糊查询关键字
     * @return
     */
    PageInfo getBookInfoByUserId(Integer uid, Integer pageNum, Integer pageSize, String mohu);

    /**
     * 分页查询预定信息
     * @param pageNum   页号
     * @param pageSize  页大小
     * @param mohu  模糊查询关键字
     * @return
     */
    PageInfo getAllBookInfo(Integer pageNum, Integer pageSize, String mohu);

    /**
     * 分页根据场地id查询预定信息
     * @param pageNum   页号
     * @param pageSize  页大小
     * @param pid  场地id
     * @return
     */
    PageInfo getBookInfoByPlaceId(Integer pid,Integer pageNum, Integer pageSize);

    /**
     * 更新预定信息
     * @param bookId    预定id
     * @param status    预定状态
     */
    void updateBookInfoStatus(Integer bookId,Integer status);

    /**
     * 删除预定信息
     * @param id  预定id
     */
    void deleteBookInfoById(Integer id);

    /**
     *  获取预定信息
     * @param id 预定id
     * @return
     */
    BookInfo getBookInfoById(Integer id);

    /**
     * 根据运动类型获取预定人数
     * @return  预定类型和人数
     */
    Map<String,Integer> getAllBookCountBySportType();

}
