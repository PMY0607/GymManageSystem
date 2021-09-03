package com.pmy.mapper;

import com.pmy.pojo.BookInfo;
import com.pmy.pojo.Place;
import com.pmy.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface BookMapper {

    @Insert(" insert into book_info\n" +
            "  (uid,place_id,count,deposit,start_time,end_time,book_time,note)\n" +
            "  values (#{info.user.id},#{info.place.id},#{info.count},#{info.deposit},#{info.startTime},#{info.endTime},#{info.bookTime},#{info.note})")
    //添加预定信息
    void insertBookInfo(@Param("info") BookInfo info);

    @Delete("delete from book_info where id = #{id}")
    //删除预定信息
    void deleteBookInfo(Integer id);

    @Update("update book_info set status=#{status} where id = #{id} ")
    void updateBookInfoStatus(@Param("id") Integer id,@Param("status") Integer status);

    @Select("select * from book_info where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(
                    property = "user",
                    column = "uid",
                    javaType = User.class,
                    one = @One(select = "com.pmy.mapper.UserMapper.selectUserById")
            ),
            @Result(
                    property = "place",
                    column = "place_id",
                    javaType = Place.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectPlaceById")
            ),
            @Result(property = "count",column = "count"),
            @Result(property = "deposit",column = "deposit"),
            @Result(property = "startTime",column = "start_time"),
            @Result(property = "endTime",column = "end_time"),
            @Result(property = "bookTime",column = "book_time"),
            @Result(property = "note",column = "note"),
    })
    //根据预定id查询预定信息
    BookInfo selectBookInfoById(Integer id);

    @Select("select * from book_info where uid = #{uid} and note like '%${mohu}%' ")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(
                    property = "user",
                    column = "uid",
                    javaType = User.class,
                    one = @One(select = "com.pmy.mapper.UserMapper.selectUserById")
            ),
            @Result(
                    property = "place",
                    column = "place_id",
                    javaType = Place.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectPlaceById")
            ),
            @Result(property = "count",column = "count"),
            @Result(property = "deposit",column = "deposit"),
            @Result(property = "startTime",column = "start_time"),
            @Result(property = "endTime",column = "end_time"),
            @Result(property = "bookTime",column = "book_time"),
            @Result(property = "note",column = "note"),
    })
    //查询用户的预定信息
    List<BookInfo> selectBookInfoByUserId(@Param("uid") Integer uid,@Param("mohu")String mohu);

    @Select("select * from book_info where place_id = #{placeId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(
                    property = "user",
                    column = "uid",
                    javaType = User.class,
                    one = @One(select = "com.pmy.mapper.UserMapper.selectUserById")
            ),
            @Result(
                    property = "place",
                    column = "place_id",
                    javaType = Place.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectPlaceById")
            ),
            @Result(property = "count",column = "count"),
            @Result(property = "deposit",column = "deposit"),
            @Result(property = "startTime",column = "start_time"),
            @Result(property = "endTime",column = "end_time"),
            @Result(property = "bookTime",column = "book_time"),
            @Result(property = "note",column = "note"),
    })
    //根据场地id查询时间区间内已经被预约的信息
    List<BookInfo> selectBookInfoByPlaceId(@Param("placeId") Integer placeId);

    @Select("select * from book_info")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(
                    property = "user",
                    column = "uid",
                    javaType = User.class,
                    one = @One(select = "com.pmy.mapper.UserMapper.selectUserById")
            ),
            @Result(
                    property = "place",
                    column = "place_id",
                    javaType = Place.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectPlaceById")
            ),
            @Result(property = "count",column = "count"),
            @Result(property = "deposit",column = "deposit"),
            @Result(property = "startTime",column = "start_time"),
            @Result(property = "endTime",column = "end_time"),
            @Result(property = "bookTime",column = "book_time"),
            @Result(property = "note",column = "note"),
    })
    //查询所有的预定信息
    List<BookInfo> selectAllBookInfo();
}
