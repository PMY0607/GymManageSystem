package com.pmy.mapper;

import com.pmy.pojo.ChargeWay;
import com.pmy.pojo.Place;
import com.pmy.pojo.PlaceType;
import com.pmy.pojo.SportType;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface PlaceMapper {

    @Insert("insert into place_info (type,img_src,status,note) " +
            "values(#{typeId},#{place.imgSrc},#{place.status},#{place.note})")
    @Options(useGeneratedKeys = true,keyColumn = "id",keyProperty = "id")
    //添加场地
    void insertPlace(@Param("place")Place place,@Param("typeId")Integer typeId);

    @Delete("delete from place_info where id=#{id}")
    //删除场地
    void deletePlace(Integer id);

    @Update(
        "<script>\n"
        + "    update place_info\n"
        + " <trim prefix=\"set\" suffixOverrides=\",\">\n"
        + "  <if test=\"type!=null\">type=#{type.id},</if>\n"
        + "  <if test=\"imgSrc!=null\">img_src=#{imgSrc},</if>\n"
        + "  <if test=\"status!=null\">status=#{status},</if>\n"
        + "  <if test=\"note!=null\">note=#{note},</if>\n"
        + " </trim>\n"
        + " WHERE id=#{id}\n"
        + "</script>")
    //更新场地信息
    void updatePlace(Place place);

    @Select("select *from place_info where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "status",column = "status"),
            @Result(property = "note",column = "note"),
            @Result(property = "imgSrc",column = "img_src"),
            @Result(
                    property = "type",
                    column = "type",
                    javaType = PlaceType.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectPlaceTypeById")
            )
    })
    //根据场地id查询场地
    Place selectPlaceById(Integer id);

    @Select("select * from place_type where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(
                    property = "sportType",
                    column = "sport_type",
                    javaType = SportType.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectSportTypeById")
            ),
            @Result(
                    property = "chargeWay",
                    column = "charge_way",
                    javaType = ChargeWay.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectChargeWayById")
            ),
            @Result(property = "note",column = "note")
    })
    //查询场地类型信息
    PlaceType selectPlaceTypeById(Integer id);

    @Select("select * from sport_type where id=#{id} and pid!='null'")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(property = "pid", column = "pid"),
            @Result(
                    property = "pType",
                    column = "pid",
                    javaType = SportType.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectSportTypeById")
            )
    })
    //查询运动类型信息
    SportType selectSportTypeById(Integer id);

    @Select("select * from charge_way where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "type",column = "type"),
            @Result(property = "standard",column = "standard"),
            @Result(property = "note",column = "note"),
    })
    //查询支付方式
    ChargeWay selectChargeWayById(Integer id);

    @Select("SELECT p.* FROM place_info p,place_type t where p.type = t.id and t.name like '%${mohu}%'")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(property = "status",column = "status"),
            @Result(property = "note",column = "note"),
            @Result(property = "imgSrc",column = "img_src"),
            @Result(
                    property = "type",
                    column = "type",
                    javaType = PlaceType.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectPlaceTypeById")
            )
    })
    //查询场地
    List<Place> selectPlaceList(@Param("mohu") String mohu);

    @Select("SELECT p.* FROM place_info p,place_type t where p.type = t.id and t.name like '%${mohu}%' and p.status!=3")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(property = "status",column = "status"),
            @Result(property = "note",column = "note"),
            @Result(property = "imgSrc",column = "img_src"),
            @Result(
                    property = "type",
                    column = "type",
                    javaType = PlaceType.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectPlaceTypeById")
            )
    })
    //查询可用场地
    List<Place> selectUserPlaceList(@Param("mohu") String mohu);

    @Select("select * from sport_type where id not in (1,2,3,4)")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(
                    property = "pType",
                    column = "pid",
                    javaType = SportType.class,
                    one = @One(select = "com.pmy.mapper.PlaceMapper.selectSportTypeById")
            ),
            @Result(property = "name",column = "name")
    })
    //获取所有的运动类型
    List<SportType> selectAllBaseSportType();


    @Select("select count(*) from book_info bi where bi.place_id in\n" +
            "\t(select pi.id from place_info pi where pi.type in\t\n" +
            "\t\t(select pt.id\tfrom place_type pt where pt.sport_type =#{sportTypeId})\n" +
            "\t)")
    //从数据库中，根据SportType查询改类型下所有预定场地的数量
    Integer selectBookCountByPlaceType(Integer sportTypeId);
}
