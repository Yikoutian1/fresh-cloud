package com.fresh.client;


import com.fresh.common.entity.GoodsInfo;
import com.fresh.common.entity.GoodsType;
import com.fresh.config.ClientConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


@FeignClient(name = "goods-server", configuration = ClientConfiguration.class)
public interface GoodsClient {
    @PostMapping("/goods/updateGoodsNum")
    int updateGoodsNum(@RequestParam("gno") Integer gno, @RequestParam("num") Integer num);

    @PostMapping("/goods/upload")
    Map<String, Object> add(@RequestParam("upload") MultipartFile pic, HttpServletRequest request);

    @PostMapping("/goods/addGood")
    int addGood(@RequestParam("pic")MultipartFile[] pics, HttpServletRequest request);

    @GetMapping("/goods/finds")
    public Map<String, Object> finds1();

    @GetMapping("/goods/findByFirst")
    public Map<String, Object> findByFirst(@RequestParam Integer tno,@RequestParam  Integer rows,@RequestParam  Integer page);

    @PostMapping("/goods/findByPage")
    public List<GoodsInfo> findByPage(@RequestParam Integer tno, @RequestParam  Integer rows, @RequestParam  Integer page);

    @GetMapping("/goods/detail")
    public GoodsInfo detail(@RequestParam Integer gno);

    @PostMapping("/goods/compileStore")
    public int compileStore(@RequestParam String cno);

    @GetMapping("/goods/goodsHello")
    public String goodsHello();

    //

    // == //
//    @GetMapping("/type/finds2")
//    List<GoodsType> finds();
//    @PostMapping("/type/add")
//    int add(@RequestParam("photo") MultipartFile pic, HttpServletRequest request, String tname);
}
