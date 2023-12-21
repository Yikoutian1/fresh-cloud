package com.fresh.index.controller.goods;

import com.fresh.common.entity.GoodsType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: fresh-cloud
 * @description: 商品类型控制器
 */
@RequestMapping("/type")
public interface IGoodsTypeControllerApi {

    @GetMapping("/finds")
    List<GoodsType> finds();


    @PostMapping("/add")
    int add(@RequestParam("photo") MultipartFile pic, HttpServletRequest request, String tname);
}
