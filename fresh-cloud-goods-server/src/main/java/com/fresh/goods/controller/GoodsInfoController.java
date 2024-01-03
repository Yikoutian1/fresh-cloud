package com.fresh.goods.controller;


import com.fresh.common.entity.CartInfo;
import com.fresh.common.entity.GoodsInfo;
import com.fresh.common.model.GoodModel;
import com.fresh.goods.service.IGoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/goods")
public class GoodsInfoController  {
	@Autowired
	private IGoodsInfoService service;

	@PostMapping("/upload")
	public Map<String, Object> add(@RequestParam("upload") MultipartFile pic, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (pic.isEmpty()) {
			return map;
		}
		try {
			String savePath = "pics";
			
			String path = request.getServletContext().getRealPath("");
			String temp = request.getServletContext().getInitParameter("uploadPath");
			if (temp != null) {
				savePath = temp;
			}
			
			// 在用户上传的文件名的前面加上时间戳
			savePath += "/" + System.currentTimeMillis()+ "_" + pic.getOriginalFilename(); // pics/14384354545_1.jpg
			File dest = new File(new File(path).getParentFile(), savePath);
			// 将本地图片保存到服务器
			pic.transferTo(dest);
			
			map.put("fileName", pic.getOriginalFilename());
			map.put("uploaded", 1);
			map.put("url", "../../../"+ savePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	@PostMapping("/updateGoodsNum")
	public  int updateGoodsNum(@RequestParam("gno") Integer gno, @RequestParam("num") Integer num){
		return service.updateGoodsNum(gno,num);
	}

	/**
	 * 直接下单
	 * @param gno
	 * @param session
	 * @return
	 */
	@PostMapping(value = "/addSessionGoods")
	public Map<String,Object> addSessionGoods(@RequestParam("gno") Integer gno,@RequestParam("nums") Integer nums, HttpSession session ){
		List<GoodModel> goodModelList = service.addSessionGoods(gno, nums, session);
		session.setAttribute("orderInfos",goodModelList);
		Map<String,Object> map=new HashMap<>();
		map.put("code",0);
		return map;
	}
	@PostMapping("/addGood")
	public int addGood(@RequestParam("pic")MultipartFile[] pics, HttpServletRequest request) {
		GoodsInfo gf = new GoodsInfo();
		if (pics != null && pics.length > 0 && !pics[0].isEmpty()) { // 说明有图片
			try {
				String savePath = "pics";
				
				String basepath = request.getServletContext().getRealPath("");
				String temp = request.getServletContext().getInitParameter("uploadPath");
				if (temp != null) {
					savePath = temp;
				}
				
				String picStr = "";
				File dest = null;
				String path = null;
				
				// 开始图片的循环上传
				for (MultipartFile fl : pics) {
					path = savePath + "/" + System.currentTimeMillis() + "_" + fl.getOriginalFilename(); // pics/14384354545_1.jpg
					dest = new File(new File(basepath).getParentFile(), path);
					fl.transferTo(dest);
					picStr += path + ";";
				}
				
				if (!"".equals(picStr)) {
					picStr = picStr.substring(0, picStr.lastIndexOf(";"));
				}
				gf.setPics(picStr);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return service.add(gf);
	}

	@GetMapping("/finds")
	public Map<String, Object> finds() {
		return service.finds();
	}

	@GetMapping("/findByFirst")
	public Map<String, Object> findByFirst(@RequestParam Integer tno,@RequestParam  Integer rows,@RequestParam  Integer page) {
		return service.findByFirst(tno, page, rows);
	}

	@PostMapping("/findByPage")
	public List<GoodsInfo> findByPage(@RequestParam Integer tno, @RequestParam  Integer rows, @RequestParam  Integer page) {
		return service.findByType(tno, page, rows);
	}

	@GetMapping("/detail")
	public GoodsInfo detail(@RequestParam Integer gno) {
		return service.findByGno(gno);
	}

	@PostMapping("/compileStore")
	public int compileStore(@RequestParam String cno) {
		String[] cnoArray = cno.split(",");
		int result= service.updateStore(cnoArray);
		return result;
	}

	@GetMapping("/goodsHello")
	public String goodsHello() {
		return "goods port 8070";
	}
}
