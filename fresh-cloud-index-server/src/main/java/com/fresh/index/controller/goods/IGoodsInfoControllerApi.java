package com.fresh.index.controller.goods;


import com.fresh.common.entity.GoodsInfo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @program: fresh-cloud
 */
//全局降级
@FeignClient(value = "goods-server")
@RequestMapping("/goods")
public interface IGoodsInfoControllerApi {

    @PostMapping("/upload")
    Map<String, Object> add(@RequestParam("upload") MultipartFile pic, HttpServletRequest request);

    @PostMapping("/addGood")
    int addGood(@RequestParam("pic")MultipartFile[] pics, HttpServletRequest request);

    @GetMapping("/finds")
    public Map<String, Object> finds();

    @GetMapping("/findByFirst")
    public Map<String, Object> findByFirst(@RequestParam Integer tno,@RequestParam  Integer rows,@RequestParam  Integer page);

    @PostMapping("/findByPage")
    public List<GoodsInfo> findByPage(@RequestParam Integer tno, @RequestParam  Integer rows, @RequestParam  Integer page);

    @GetMapping("/detail")
    public GoodsInfo detail(@RequestParam Integer gno);

    @PostMapping("/compileStore")
    public int compileStore(@RequestParam String cno);

    @GetMapping("/goodsHello")
    public String goodsHello();

}
