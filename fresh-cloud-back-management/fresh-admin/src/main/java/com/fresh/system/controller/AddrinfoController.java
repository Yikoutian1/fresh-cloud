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
import com.fresh.system.domain.Addrinfo;
import com.fresh.system.service.IAddrinfoService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 地址信息Controller
 *
 * @author calyee
 * @date 2023-12-26
 */
@RestController
@RequestMapping("/system/addrinfo")
public class AddrinfoController extends BaseController {
    @Autowired
    private IAddrinfoService addrinfoService;

    /**
     * 查询地址信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:addrinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(Addrinfo addrinfo) {
        startPage();
        List<Addrinfo> list = addrinfoService.selectAddrinfoList(addrinfo);
        return getDataTable(list);
    }

    /**
     * 导出地址信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:addrinfo:export')")
    @Log(title = "地址信息" , businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Addrinfo addrinfo) {
        List<Addrinfo> list = addrinfoService.selectAddrinfoList(addrinfo);
        ExcelUtil<Addrinfo> util = new ExcelUtil<Addrinfo>(Addrinfo.class);
        util.exportExcel(response, list, "地址信息数据");
    }

    /**
     * 获取地址信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:addrinfo:query')")
    @GetMapping(value = "/{ano}")
    public AjaxResult getInfo(@PathVariable("ano") String ano) {
        return success(addrinfoService.selectAddrinfoByAno(ano));
    }

    /**
     * 新增地址信息
     */
    @PreAuthorize("@ss.hasPermi('system:addrinfo:add')")
    @Log(title = "地址信息" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Addrinfo addrinfo) {
        return toAjax(addrinfoService.insertAddrinfo(addrinfo));
    }

    /**
     * 修改地址信息
     */
    @PreAuthorize("@ss.hasPermi('system:addrinfo:edit')")
    @Log(title = "地址信息" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Addrinfo addrinfo) {
        return toAjax(addrinfoService.updateAddrinfo(addrinfo));
    }

    /**
     * 删除地址信息
     */
    @PreAuthorize("@ss.hasPermi('system:addrinfo:remove')")
    @Log(title = "地址信息" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{anos}")
    public AjaxResult remove(@PathVariable String[] anos) {
        return toAjax(addrinfoService.deleteAddrinfoByAnos(anos));
    }
}
