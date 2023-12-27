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
import com.fresh.system.domain.Goodsinfo;
import com.fresh.system.service.IGoodsinfoService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 商品信息Controller
 *
 * @author calyee
 * @date 2023-12-26
 */
@RestController
@RequestMapping("/system/goodsinfo")
public class GoodsinfoController extends BaseController {
    @Autowired
    private IGoodsinfoService goodsinfoService;

    /**
     * 查询商品信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:goodsinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(Goodsinfo goodsinfo) {
        startPage();
        List<Goodsinfo> list = goodsinfoService.selectGoodsinfoList(goodsinfo);
        return getDataTable(list);
    }

    /**
     * 导出商品信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:goodsinfo:export')")
    @Log(title = "商品信息" , businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Goodsinfo goodsinfo) {
        List<Goodsinfo> list = goodsinfoService.selectGoodsinfoList(goodsinfo);
        ExcelUtil<Goodsinfo> util = new ExcelUtil<Goodsinfo>(Goodsinfo.class);
        util.exportExcel(response, list, "商品信息数据");
    }

    /**
     * 获取商品信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:goodsinfo:query')")
    @GetMapping(value = "/{gno}")
    public AjaxResult getInfo(@PathVariable("gno") Long gno) {
        return success(goodsinfoService.selectGoodsinfoByGno(gno));
    }

    /**
     * 新增商品信息
     */
    @PreAuthorize("@ss.hasPermi('system:goodsinfo:add')")
    @Log(title = "商品信息" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Goodsinfo goodsinfo) {
        return toAjax(goodsinfoService.insertGoodsinfo(goodsinfo));
    }

    /**
     * 修改商品信息
     */
    @PreAuthorize("@ss.hasPermi('system:goodsinfo:edit')")
    @Log(title = "商品信息" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Goodsinfo goodsinfo) {
        return toAjax(goodsinfoService.updateGoodsinfo(goodsinfo));
    }

    /**
     * 删除商品信息
     */
    @PreAuthorize("@ss.hasPermi('system:goodsinfo:remove')")
    @Log(title = "商品信息" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{gnos}")
    public AjaxResult remove(@PathVariable Long[] gnos) {
        return toAjax(goodsinfoService.deleteGoodsinfoByGnos(gnos));
    }
}
