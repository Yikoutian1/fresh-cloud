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
import com.fresh.system.domain.Orderiteminfo;
import com.fresh.system.service.IOrderiteminfoService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 订单对象信息Controller
 *
 * @author calyee
 * @date 2023-12-26
 */
@RestController
@RequestMapping("/system/orderiteminfo")
public class OrderiteminfoController extends BaseController {
    @Autowired
    private IOrderiteminfoService orderiteminfoService;

    /**
     * 查询订单对象信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:orderiteminfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(Orderiteminfo orderiteminfo) {
        startPage();
        List<Orderiteminfo> list = orderiteminfoService.selectOrderiteminfoList(orderiteminfo);
        return getDataTable(list);
    }

    /**
     * 导出订单对象信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:orderiteminfo:export')")
    @Log(title = "订单对象信息" , businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Orderiteminfo orderiteminfo) {
        List<Orderiteminfo> list = orderiteminfoService.selectOrderiteminfoList(orderiteminfo);
        ExcelUtil<Orderiteminfo> util = new ExcelUtil<Orderiteminfo>(Orderiteminfo.class);
        util.exportExcel(response, list, "订单对象信息数据");
    }

    /**
     * 获取订单对象信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderiteminfo:query')")
    @GetMapping(value = "/{ino}")
    public AjaxResult getInfo(@PathVariable("ino") Long ino) {
        return success(orderiteminfoService.selectOrderiteminfoByIno(ino));
    }

    /**
     * 新增订单对象信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderiteminfo:add')")
    @Log(title = "订单对象信息" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Orderiteminfo orderiteminfo) {
        return toAjax(orderiteminfoService.insertOrderiteminfo(orderiteminfo));
    }

    /**
     * 修改订单对象信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderiteminfo:edit')")
    @Log(title = "订单对象信息" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Orderiteminfo orderiteminfo) {
        return toAjax(orderiteminfoService.updateOrderiteminfo(orderiteminfo));
    }

    /**
     * 删除订单对象信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderiteminfo:remove')")
    @Log(title = "订单对象信息" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{inos}")
    public AjaxResult remove(@PathVariable Long[] inos) {
        return toAjax(orderiteminfoService.deleteOrderiteminfoByInos(inos));
    }
}
