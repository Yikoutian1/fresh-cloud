package com.fresh.client;


import com.fresh.common.entity.GoodsType;
import com.fresh.config.ClientConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@FeignClient(name = "goods-server", configuration = ClientConfiguration.class)
public interface GoodsTypeClient {
    @GetMapping("/type/finds")
    List<GoodsType> finds();
    @PostMapping("/type/add")
    int add(@RequestParam("photo") MultipartFile pic, HttpServletRequest request, String tname);
}
