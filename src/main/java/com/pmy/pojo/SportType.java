package com.pmy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class SportType {
    private Integer id;
    private Integer pid;        //父种类id
    private SportType pType;    //父种类
    private String name;        //运动类型名
}
