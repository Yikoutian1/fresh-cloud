package com.yc.index.controller.goods;

import com.yc.common.entity.GoodsType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: yc-fresh-cloud
 * @description: 商品类型控制器
 * @author: 作者 huchaojie
 * @create: 2021-10-05 15:32
 */
@RequestMapping("/type")
public interface IGoodsTypeControllerApi {

    @GetMapping("/finds")
    List<GoodsType> finds();


    @PostMapping("/add")
    int add(@RequestParam("photo") MultipartFile pic, HttpServletRequest request, String tname);
}
