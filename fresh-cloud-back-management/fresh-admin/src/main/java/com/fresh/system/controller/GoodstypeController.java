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
import com.fresh.system.domain.Goodstype;
import com.fresh.system.service.IGoodstypeService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 商品类型Controller
 *
 * @author calyee
 * @date 2023-12-26
 */
@RestController
@RequestMapping("/system/goodstype")
public class GoodstypeController extends BaseController {
    @Autowired
    private IGoodstypeService goodstypeService;

    /**
     * 查询商品类型列表
     */
    @PreAuthorize("@ss.hasPermi('system:goodstype:list')")
    @GetMapping("/list")
    public TableDataInfo list(Goodstype goodstype) {
        startPage();
        List<Goodstype> list = goodstypeService.selectGoodstypeList(goodstype);
        return getDataTable(list);
    }

    /**
     * 导出商品类型列表
     */
    @PreAuthorize("@ss.hasPermi('system:goodstype:export')")
    @Log(title = "商品类型" , businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Goodstype goodstype) {
        List<Goodstype> list = goodstypeService.selectGoodstypeList(goodstype);
        ExcelUtil<Goodstype> util = new ExcelUtil<Goodstype>(Goodstype.class);
        util.exportExcel(response, list, "商品类型数据");
    }

    /**
     * 获取商品类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:goodstype:query')")
    @GetMapping(value = "/{tno}")
    public AjaxResult getInfo(@PathVariable("tno") Long tno) {
        return success(goodstypeService.selectGoodstypeByTno(tno));
    }

    /**
     * 新增商品类型
     */
    @PreAuthorize("@ss.hasPermi('system:goodstype:add')")
    @Log(title = "商品类型" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Goodstype goodstype) {
        return toAjax(goodstypeService.insertGoodstype(goodstype));
    }

    /**
     * 修改商品类型
     */
    @PreAuthorize("@ss.hasPermi('system:goodstype:edit')")
    @Log(title = "商品类型" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Goodstype goodstype) {
        return toAjax(goodstypeService.updateGoodstype(goodstype));
    }

    /**
     * 删除商品类型
     */
    @PreAuthorize("@ss.hasPermi('system:goodstype:remove')")
    @Log(title = "商品类型" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{tnos}")
    public AjaxResult remove(@PathVariable Long[] tnos) {
        return toAjax(goodstypeService.deleteGoodstypeByTnos(tnos));
    }
}
