package com.pmy.controller;

import com.github.pagehelper.PageInfo;
import com.pmy.pojo.BookInfo;
import com.pmy.pojo.Place;
import com.pmy.service.BookService;
import com.pmy.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

@RequestMapping("/book")
@Controller
public class BookPlaceController {
    @Autowired
    PlaceService placeService;

    @Autowired
    BookService bookService;

    @RequestMapping("/showPlace")
    //用户分页显示所有场地信息
    public ModelAndView getPlaceByPage(ModelAndView mv, String mohu,
                       @RequestParam(defaultValue = "1") Integer pageNum,
                       @RequestParam(defaultValue = "5") Integer pageSize){
        if(mohu == null) mohu = "";
        mv.addObject("page",placeService.queryUserPlacePage(pageNum, pageSize,mohu));
        mv.addObject("mohu",mohu);
        mv.setViewName("/user/placeList");
        return mv;
    }

    @RequestMapping("/getPlaceInfo")
    @ResponseBody
    //获取单个场地信息
    public Place getPlaceInfo(Integer id){
        Place place = placeService.queryPlaceById(id);
        return place;
    }

    @RequestMapping("/bookPlace")
    //预定场地
    public String bookPlaceInfo(Integer placeId, Date startTime, Integer count,String note, HttpServletRequest req){
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        bookService.bookPlace(userId,placeId,startTime,count,note);
        return "redirect:/book/showPlace";
    }

    @RequestMapping("/setBookStatus")
    //设置预定状态
    public String bookPlaceInfo(Integer bookId,Integer status){
        bookService.updateBookInfoStatus(bookId,status);
        return "redirect:/book/bookInfoList";
    }

    @RequestMapping("/userBookInfo")
    //获取用户的预定信息
    public ModelAndView getUserBookInfo(ModelAndView mv, String mohu,HttpServletRequest req,
                                       @RequestParam(defaultValue = "1") Integer pageNum,
                                       @RequestParam(defaultValue = "5") Integer pageSize){
        if(mohu == null) {mohu = "";}
        Integer uid = (Integer) req.getSession().getAttribute("userId");
        mv.addObject("page",bookService.getBookInfoByUserId(uid,pageNum, pageSize,mohu));
        mv.addObject("mohu",mohu);
        mv.setViewName("/user/myBookList");
        return mv;
    }

    @RequestMapping("/cancelBook")
    //取消预定信息
    public String  cancelBook(Integer id){
        bookService.deleteBookInfoById(id);
        return "redirect:/book/userBookInfo";
    }

    @RequestMapping("/getBookInfo")
    @ResponseBody
    //根据预定id获取预定信息
    public BookInfo getBookInfoById(Integer id){
        return  bookService.getBookInfoById(id);
    }


    @RequestMapping("/bookInfoList")
    //获取所有用户的预定信息
    public ModelAndView getBookInfoList(ModelAndView mv, String mohu,
                    @RequestParam(defaultValue = "1") Integer pageNum,
                    @RequestParam(defaultValue = "5") Integer pageSize){
        PageInfo page = bookService.getAllBookInfo(pageNum, pageSize, mohu);
        mv.addObject("page",page);
        mv.setViewName("/admin/bookList");
        return mv;
    }


    @RequestMapping("/getBookCountBySportType")
    //预定财务报表
    public ModelAndView getBookCountBySportType(ModelAndView mv){
        Map<String, Integer> counts = bookService.getAllBookCountBySportType();
        mv.addObject("names",counts.keySet());
        mv.addObject("map",counts);
        mv.setViewName("admin/financialState");
        return mv;
    }
}
