package com.pmy.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChargeWay {
    private Integer id;
    private Integer type;           //计费类型，0:按次 1:按时
    private Integer standard;    //计费标准  多少钱？不同类型运动场所的不同计费标准
    private String note;
}
