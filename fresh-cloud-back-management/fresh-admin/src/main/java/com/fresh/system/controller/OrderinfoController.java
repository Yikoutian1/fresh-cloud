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
import com.fresh.system.domain.Orderinfo;
import com.fresh.system.service.IOrderinfoService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 订单信息Controller
 * 
 * @author calyee
 * @date 2024-01-03
 */
@RestController
@RequestMapping("/system/orderinfo")
public class OrderinfoController extends BaseController
{
    @Autowired
    private IOrderinfoService orderinfoService;

    /**
     * 查询订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:orderinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(Orderinfo orderinfo)
    {
        startPage();
        List<Orderinfo> list = orderinfoService.selectOrderinfoList(orderinfo);
        return getDataTable(list);
    }

    /**
     * 导出订单信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:orderinfo:export')")
    @Log(title = "订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Orderinfo orderinfo)
    {
        List<Orderinfo> list = orderinfoService.selectOrderinfoList(orderinfo);
        ExcelUtil<Orderinfo> util = new ExcelUtil<Orderinfo>(Orderinfo.class);
        util.exportExcel(response, list, "订单信息数据");
    }

    /**
     * 获取订单信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderinfo:query')")
    @GetMapping(value = "/{ono}")
    public AjaxResult getInfo(@PathVariable("ono") String ono)
    {
        return success(orderinfoService.selectOrderinfoByOno(ono));
    }

    /**
     * 新增订单信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderinfo:add')")
    @Log(title = "订单信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Orderinfo orderinfo)
    {
        return toAjax(orderinfoService.insertOrderinfo(orderinfo));
    }

    /**
     * 修改订单信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderinfo:edit')")
    @Log(title = "订单信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Orderinfo orderinfo)
    {
        return toAjax(orderinfoService.updateOrderinfo(orderinfo));
    }

    /**
     * 删除订单信息
     */
    @PreAuthorize("@ss.hasPermi('system:orderinfo:remove')")
    @Log(title = "订单信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{onos}")
    public AjaxResult remove(@PathVariable String[] onos)
    {
        return toAjax(orderinfoService.deleteOrderinfoByOnos(onos));
    }
}
