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
import com.fresh.system.domain.Memberinfo;
import com.fresh.system.service.IMemberinfoService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 会员Controller
 * 
 * @author calyee
 * @date 2023-12-26
 */
@RestController
@RequestMapping("/system/memberinfo")
public class MemberinfoController extends BaseController
{
    @Autowired
    private IMemberinfoService memberinfoService;

    /**
     * 查询会员列表
     */
    @PreAuthorize("@ss.hasPermi('system:memberinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(Memberinfo memberinfo)
    {
        startPage();
        List<Memberinfo> list = memberinfoService.selectMemberinfoList(memberinfo);
        return getDataTable(list);
    }

    /**
     * 导出会员列表
     */
    @PreAuthorize("@ss.hasPermi('system:memberinfo:export')")
    @Log(title = "会员", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Memberinfo memberinfo)
    {
        List<Memberinfo> list = memberinfoService.selectMemberinfoList(memberinfo);
        ExcelUtil<Memberinfo> util = new ExcelUtil<Memberinfo>(Memberinfo.class);
        util.exportExcel(response, list, "会员数据");
    }

    /**
     * 获取会员详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:memberinfo:query')")
    @GetMapping(value = "/{mno}")
    public AjaxResult getInfo(@PathVariable("mno") Long mno)
    {
        return success(memberinfoService.selectMemberinfoByMno(mno));
    }

    /**
     * 新增会员
     */
    @PreAuthorize("@ss.hasPermi('system:memberinfo:add')")
    @Log(title = "会员", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Memberinfo memberinfo)
    {
        return toAjax(memberinfoService.insertMemberinfo(memberinfo));
    }

    /**
     * 修改会员
     */
    @PreAuthorize("@ss.hasPermi('system:memberinfo:edit')")
    @Log(title = "会员", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Memberinfo memberinfo)
    {
        return toAjax(memberinfoService.updateMemberinfo(memberinfo));
    }

    /**
     * 删除会员
     */
    @PreAuthorize("@ss.hasPermi('system:memberinfo:remove')")
    @Log(title = "会员", businessType = BusinessType.DELETE)
	@DeleteMapping("/{mnos}")
    public AjaxResult remove(@PathVariable Long[] mnos)
    {
        return toAjax(memberinfoService.deleteMemberinfoByMnos(mnos));
    }
}
