package com.pmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pmy.mapper.PlaceMapper;
import com.pmy.pojo.Place;
import com.pmy.pojo.User;
import com.pmy.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PlaceServiceImpl implements PlaceService {
    @Autowired
    PlaceMapper placeMapper;

    @Override
    public void addPlace(Place place,Integer typeId) {
        placeMapper.insertPlace(place,typeId);
    }

    @Override
    public void deletePlace(Integer id) {
        placeMapper.deletePlace(id);
    }

    @Override
    public void updatePlace(Place place) {
        placeMapper.updatePlace(place);
    }

    @Override
    public Place queryPlaceById(Integer id) {
        return placeMapper.selectPlaceById(id);
    }

    @Override
    public PageInfo<Place> queryPlacePage(Integer pageNum,Integer pageSize,String mohu) {
        PageHelper.startPage(pageNum,pageSize);
        List<Place> list=  placeMapper.selectPlaceList(mohu);
        return new PageInfo(list);
    }

    @Override
    public PageInfo queryUserPlacePage(Integer pageNum, Integer pageSize, String mohu) {
        PageHelper.startPage(pageNum,pageSize);
        List<Place> list=  placeMapper.selectUserPlaceList(mohu);
        return new PageInfo(list);
    }


}
