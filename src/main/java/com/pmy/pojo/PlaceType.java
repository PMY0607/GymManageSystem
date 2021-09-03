package com.pmy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaceType {
    private Integer id;
    private String name;
    private SportType sportType;    //运动类型
    private ChargeWay chargeWay;    //计费方式
    private String note;  //备注
}
