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
import com.fresh.system.domain.Admininfo;
import com.fresh.system.service.IAdmininfoService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 管理员Controller
 *
 * @author calyee
 * @date 2023-12-26
 */
@RestController
@RequestMapping("/system/admininfo")
public class AdmininfoController extends BaseController {
    @Autowired
    private IAdmininfoService admininfoService;

    /**
     * 查询管理员列表
     */
    @PreAuthorize("@ss.hasPermi('system:admininfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(Admininfo admininfo) {
        startPage();
        List<Admininfo> list = admininfoService.selectAdmininfoList(admininfo);
        return getDataTable(list);
    }

    /**
     * 导出管理员列表
     */
    @PreAuthorize("@ss.hasPermi('system:admininfo:export')")
    @Log(title = "管理员" , businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Admininfo admininfo) {
        List<Admininfo> list = admininfoService.selectAdmininfoList(admininfo);
        ExcelUtil<Admininfo> util = new ExcelUtil<Admininfo>(Admininfo.class);
        util.exportExcel(response, list, "管理员数据");
    }

    /**
     * 获取管理员详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:admininfo:query')")
    @GetMapping(value = "/{aid}")
    public AjaxResult getInfo(@PathVariable("aid") Long aid) {
        return success(admininfoService.selectAdmininfoByAid(aid));
    }

    /**
     * 新增管理员
     */
    @PreAuthorize("@ss.hasPermi('system:admininfo:add')")
    @Log(title = "管理员" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Admininfo admininfo) {
        return toAjax(admininfoService.insertAdmininfo(admininfo));
    }

    /**
     * 修改管理员
     */
    @PreAuthorize("@ss.hasPermi('system:admininfo:edit')")
    @Log(title = "管理员" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Admininfo admininfo) {
        return toAjax(admininfoService.updateAdmininfo(admininfo));
    }

    /**
     * 删除管理员
     */
    @PreAuthorize("@ss.hasPermi('system:admininfo:remove')")
    @Log(title = "管理员" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{aids}")
    public AjaxResult remove(@PathVariable Long[] aids) {
        return toAjax(admininfoService.deleteAdmininfoByAids(aids));
    }
}
