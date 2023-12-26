package com.fresh.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.fresh.common.annotation.Log;
import com.fresh.common.core.controller.BaseController;
import com.fresh.common.core.domain.AjaxResult;
import com.fresh.common.enums.BusinessType;
import com.fresh.system.domain.Cartinfo;
import com.fresh.system.service.ICartinfoService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 购物车信息Controller
 *
 * @author calyee
 * @date 2023-12-26
 */
@RestController
@RequestMapping("/system/cartinfo")
public class CartinfoController extends BaseController {
    @Autowired
    private ICartinfoService cartinfoService;

    /**
     * 查询购物车信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:cartinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(Cartinfo cartinfo) {
        startPage();
        List<Cartinfo> list = cartinfoService.selectCartinfoList(cartinfo);
        return getDataTable(list);
    }

    /**
     * 导出购物车信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:cartinfo:export')")
    @Log(title = "购物车信息" , businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Cartinfo cartinfo) {
        List<Cartinfo> list = cartinfoService.selectCartinfoList(cartinfo);
        ExcelUtil<Cartinfo> util = new ExcelUtil<Cartinfo>(Cartinfo.class);
        util.exportExcel(response, list, "购物车信息数据");
    }

    /**
     * 获取购物车信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:cartinfo:query')")
    @GetMapping(value = "/{cno}")
    public AjaxResult getInfo(@PathVariable("cno") String cno) {
        return success(cartinfoService.selectCartinfoByCno(cno));
    }

    /**
     * 新增购物车信息
     */
    @PreAuthorize("@ss.hasPermi('system:cartinfo:add')")
    @Log(title = "购物车信息" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Cartinfo cartinfo) {
        return toAjax(cartinfoService.insertCartinfo(cartinfo));
    }

    /**
     * 修改购物车信息
     */
    @PreAuthorize("@ss.hasPermi('system:cartinfo:edit')")
    @Log(title = "购物车信息" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Cartinfo cartinfo) {
        return toAjax(cartinfoService.updateCartinfo(cartinfo));
    }

    /**
     * 删除购物车信息
     */
    @PreAuthorize("@ss.hasPermi('system:cartinfo:remove')")
    @Log(title = "购物车信息" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{cnos}")
    public AjaxResult remove(@PathVariable String[] cnos) {
        return toAjax(cartinfoService.deleteCartinfoByCnos(cnos));
    }
}
