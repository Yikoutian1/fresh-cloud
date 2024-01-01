package com.fresh.cart.controller;

import com.fresh.cart.service.ICartInfoService;
import com.fresh.common.entity.CartInfo;
import com.fresh.common.entity.MemberInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/cart")
public class CartInfoController {

    @Autowired
    private ICartInfoService service;

    private MemberInfo getMemberInfo(HttpSession session) {
        Object obj = session.getAttribute("loginMember");
        if (obj == null) { // 说明没有登录
            return null;
        }
        return (MemberInfo) obj;
    }

    @PostMapping("/getInfo")
    public List<Map<String, Object>> getInfo(HttpSession session) {
        MemberInfo mf = this.getMemberInfo(session);
        if (mf == null) { // 说明没有登录
            return Collections.emptyList();
        }
        return service.findByMno(mf.getMno()); // 根据会员编号，查询购物车信息
    }

    @PostMapping("/update")
    public int update(CartInfo cf) {
        cf.setNum(1);
        return service.update(cf);
    }

    @PostMapping("/updates")
    public int updates(CartInfo cf) {
        return service.update(cf);
    }

    /**
     * 根据购物车编号修该数量
     * @param cno
     * @param num
     * @return
     */
    @PostMapping(value = "/updateCartNum")
    public int updateCartNum(@RequestParam("cno") String cno ,@RequestParam("num") Integer num){
        return service.updateCartNum(cno,num);
    }

    /**
     * 通过session存购物车勾选的列表
     * @param cnos
     * @return
     */
    @PostMapping(value = "/addSessionCart")
    public Map<String,Object> addSessionCart(@RequestParam("cnos") String cnos,HttpSession session ){
        List<CartInfo> cartInfos = service.findByCnos(cnos.split(","));
        session.setAttribute("cartInfos",cartInfos);
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        return map;
    }
    @PostMapping(value = "/getSessionCart")
    public  List<CartInfo> getSessionCart(HttpSession session ){
        List<CartInfo> cartInfos = (List<CartInfo>) session.getAttribute("cartInfos");
        return cartInfos;
    }

    @PostMapping(value = "/deleteCartGoodsByCno")
    public Map<String,Object> deleteCartGoodsByCno(@RequestParam("cno") String cno ){
        Map<String,Object> map=new HashMap<>();
        if (service.deleteByCno(cno)>0){
            map.put("code",0);
            map.put("msg","您的该商品已从购物车移除");
        }else {
            map.put("code",1);
            map.put("mag","系统繁忙，请稍后再试");
        }
        return map;
    }

    @PostMapping("/add")
    public Map<String, Object> add(HttpServletRequest request) {
        HttpSession session = request.getSession();

        CartInfo cf = new CartInfo();
        cf.setNum(Integer.valueOf(request.getParameter("num")));
        cf.setGno(Integer.valueOf(request.getParameter("gno")));
        cf.setMno(Integer.valueOf(request.getParameter("mno")));

        String cno = service.add(cf);
        if (!"0".equals(cno)) { // 说明加入购物车成功
            List<Map<String, Object>> mapList = (List<Map<String, Object>>) session.getAttribute("cartInfos");
            if (mapList != null && !mapList.isEmpty()) {
                //List<Map<String, Object>> list = (List<Map<String, Object>>) obj;
                Map<String, Object> map = new HashMap<>();
                map.put("cno", cno);
                map.put("gno", cf.getGno());
                mapList.add(map);
                session.setAttribute("cartInfos", mapList);
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("code", 1);
        map.put("obj", cno);
        return map;
    }

    @PostMapping("/finds")
    public List<CartInfo> finds(HttpSession session) {
        MemberInfo mf = this.getMemberInfo(session);
        if (mf == null) { // 说明没有登录
            return null;
        }
        List<CartInfo> list = service.finds(mf.getMno());
        session.setAttribute("cartInfos", list);
        return list;
    }

    @PostMapping("/decrease")
    public int decrease(String[] cno) {
        return service.delete(cno);
    }

    @PostMapping("/")
    public List<CartInfo> findByCnos(String cno) {
        return service.findByCnos(cno.split(","));
    }

    @ResponseBody
    @PostMapping("/findMnoByCnos")
    public List<CartInfo> findMnoByCnos(String mno) {
        return service.finds(Integer.valueOf(mno));
    }

    @GetMapping("/cartHello")
    public String cartHello() {
        return "cart port 8060";
    }
}
