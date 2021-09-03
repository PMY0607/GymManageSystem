package com.pmy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookInfo {
    private Integer id;
    private User user;            //用户id
    private String userType;       //用户类型  0:普通用户(也可以是电话预定或者其他方式预定，那么uid可用存放其他的东西) 1:会员用户
    private Place place;            //预定的场地
    private ChargeWay chargeWay;    //支付方式
    private Integer deposit;        //押金
    private Integer count;          //预定一个场地多久
    private Date startTime;         //开始时间
    private Date endTime;           //预计结束时间
    private Date bookTime;          //预定时间
    private String note;            //备注
    private Integer status;         //预定状态  0:未处理 1:预约成功  2:拒绝

}
