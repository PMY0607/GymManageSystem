package com.pmy.controller;

import com.pmy.pojo.Place;
import com.pmy.pojo.PlaceType;
import com.pmy.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/place")
public class PlaceController {
    @Autowired
    PlaceService placeService;

    @RequestMapping("/showPlace")
    public ModelAndView getPlaceByPage(ModelAndView mv,String mohu,
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "5") Integer pageSize){
        if(mohu == null) mohu = "";
        mv.addObject("page",placeService.queryPlacePage(pageNum, pageSize,mohu));
        mv.addObject("mohu",mohu);
        mv.setViewName("/admin/placeList");
        return mv;
    }

    @RequestMapping("/addPlace")
    public String addPlace(Place place,Integer typeId){
        placeService.addPlace(place,typeId);
        return "redirect:/place/showPlace";
    }

    @RequestMapping("/deletePlace")
    public String delPlace(Integer id){
        placeService.deletePlace(id);
        return "redirect:/place/showPlace";
    }

    @RequestMapping("/updatePlace")
    public String updatePlace(Place place,Integer typeId){
        place.setType(new PlaceType(typeId,null,null,null,null));
        placeService.updatePlace(place);
        return "redirect:/place/showPlace";
    }

    @RequestMapping("/getPlaceInfo")
    @ResponseBody
    public Place getPlaceInfo(Integer id){
        return placeService.queryPlaceById(id);
    }

}
