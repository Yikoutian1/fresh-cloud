package com.fresh.common.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2024-01-03 16:41
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GoodModel implements Serializable {
    public int gno;
    public int num;
    public String gname;
    public Double price;
    public String pics;
    public String unit;
    public String weight;
}
