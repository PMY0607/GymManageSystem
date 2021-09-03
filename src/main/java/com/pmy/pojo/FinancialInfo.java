package com.pmy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class FinancialInfo {
    private Integer id;
    private Integer uid;            //用户id
    private Place place;            //预定的场地
    private PlaceType placeType;    //场地类型
    private String user_type;       //用户类型  0:普通用户(也可以是电话预定或者其他方式预定，那么uid可用存放其他的东西) 1:会员用户
    private Integer type;           //计费类型，0:按次 1:按时
    private BigDecimal standard;    //计费标准  多少钱？不同类型运动场所的不同计费标准
    private Integer deposit;        //押金
    private Date start_time;        //开始时间
    private Date end_time;          //结束时间
    private BigDecimal cost;        //花费金额

}
