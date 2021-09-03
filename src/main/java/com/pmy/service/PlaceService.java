package com.pmy.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.pmy.pojo.Place;

import java.util.List;

public interface PlaceService {

    /**
     * 添加场地
     * @param place  场地信息
     * @param typeId    类型信息
     */
    void addPlace(Place place,Integer typeId);

    /**
     * 删除场地
     * @param id
     */
    void deletePlace(Integer id);

    /**
     * 更新场地
     * @param place
     */
    void updatePlace(Place place);

    /**
     * 根据id查询场地
     * @param id
     * @return
     */
    Place queryPlaceById(Integer id);

    /**
     * 分页查询场地
     * @param pageNum
     * @param pageSize
     * @param mohu
     * @return
     */
    PageInfo queryPlacePage(Integer pageNum, Integer pageSize,String mohu);

    /**
     *  用户查询场地
     * @param pageNum
     * @param pageSize
     * @param mohu
     * @return
     */
    PageInfo queryUserPlacePage(Integer pageNum, Integer pageSize, String mohu);
}
