package com.pmy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Place {
    private Integer id;
    private PlaceType type;
    private String imgSrc;      //场地图片路径
    private Integer status;     //可用状态 0:可用 1:正在使用 2:被预约 3:禁用
    private String note;        //备注
}
