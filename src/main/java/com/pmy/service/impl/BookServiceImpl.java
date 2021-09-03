package com.pmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pmy.mapper.BookMapper;
import com.pmy.mapper.PlaceMapper;
import com.pmy.mapper.UserMapper;
import com.pmy.pojo.BookInfo;
import com.pmy.pojo.Place;
import com.pmy.pojo.SportType;
import com.pmy.pojo.User;
import com.pmy.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.print.Book;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookMapper bookMapper;

    @Autowired
    PlaceMapper placeMapper;

    @Autowired
    UserMapper userMapper;


    @Override
    public void bookPlace(Integer uid,Integer pid,Date startTime,Integer count,String note) {

        Place place = placeMapper.selectPlaceById(pid);
        User user = userMapper.selectUserById(uid);
        Date endTime = new Date();
        BookInfo info = new BookInfo();
        if(place.getType().getChargeWay().getType() == 0){
            endTime = new Date(startTime.getTime());
            endTime.setHours(startTime.getHours()+count);
        }else{
            endTime.setHours(22);
            endTime.setMinutes(30);
        }

        info.setUser(user);
        info.setPlace(place);
        info.setCount(count);
        info.setDeposit(count*place.getType().getChargeWay().getStandard());
        info.setStartTime(startTime);
        info.setEndTime(endTime);
        info.setBookTime(new Date());
        info.setNote(note);

        bookMapper.insertBookInfo(info);

    }

    @Override
    public PageInfo<BookInfo> getBookInfoByUserId(Integer uid,Integer pageNum,Integer pageSize,String mohu) {
        PageHelper.startPage(pageNum,pageSize);
        List<BookInfo> list=  bookMapper.selectBookInfoByUserId(uid,mohu);
        return new PageInfo<BookInfo>(list);
    }

    @Override
    public PageInfo<BookInfo> getAllBookInfo(Integer pageNum, Integer pageSize, String mohu) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<BookInfo>(bookMapper.selectAllBookInfo());
    }

    @Override
    public PageInfo<BookInfo> getBookInfoByPlaceId(Integer pid,Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<BookInfo>(bookMapper.selectBookInfoByPlaceId(pid));
    }

    @Override
    public void updateBookInfoStatus(Integer bookId,Integer status) {
        bookMapper.updateBookInfoStatus(bookId,status);
    }

    @Override
    public void deleteBookInfoById(Integer id) {
        bookMapper.deleteBookInfo(id);
    }

    @Override
    public BookInfo getBookInfoById(Integer id) {
        return bookMapper.selectBookInfoById(id);
    }

    @Override
    public Map<String, Integer> getAllBookCountBySportType() {
        List<SportType> types = placeMapper.selectAllBaseSportType();
        Map<String,Integer> typeCount = new HashMap<>();
        for(SportType type :types){
            Integer count =placeMapper.selectBookCountByPlaceType(type.getId());
            typeCount.put(type.getName(),count);
        }
        return typeCount;
    }

}
