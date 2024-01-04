package com.fresh.system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import com.fresh.system.domain.vo.CouponMiddle;
import com.fresh.system.domain.vo.CouponVo;
import com.fresh.system.mapper.CouponMapper;
import com.fresh.vo.CouponDataVo;
import io.swagger.models.auth.In;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.fresh.common.annotation.Log;
import com.fresh.common.core.controller.BaseController;
import com.fresh.common.core.domain.AjaxResult;
import com.fresh.common.enums.BusinessType;
import com.fresh.system.domain.Coupon;
import com.fresh.system.service.ICouponService;
import com.fresh.common.utils.poi.ExcelUtil;
import com.fresh.common.core.page.TableDataInfo;

/**
 * 优惠券Controller
 *
 * @author calyee
 * @date 2024-01-03
 */
@RestController
@RequestMapping("/system/coupon")
public class CouponController extends BaseController {
    @Autowired
    private ICouponService couponService;


    /**
     * 查询优惠券列表
     */
    public static final String title_start = "最近";
    public static final String title_end = "天优惠券统计";
    public static final Integer used = 0;
    public static final Integer nouse = 1;
    public static final Integer expired = 2;

    @Autowired
    private CouponMapper couponMapper;

    /**
     * TODO 构造图表
     *
     * @param time
     * @return
     */
    // @PreAuthorize("@ss.hasPermi('system:coupon:list')")
    @GetMapping("/getListForCharts")
    public List<CouponDataVo> getListForCharts(@RequestParam("time") Integer time) {
        List<Coupon> list = couponService.selectAll(time);
        List<Integer> totals = list.stream().map(Coupon::getTotal).collect(Collectors.toList());
        List<Long> cids = list.stream().map(Coupon::getId).collect(Collectors.toList()); // id集合
        // 0 未使用 1已使用 2已过期
        List<CouponMiddle> iused = couponMapper.selectByStatus(used);
        List<CouponMiddle> inouse = couponMapper.selectByStatus(nouse);
        List<CouponMiddle> iexpired = couponMapper.selectByStatus(expired);

        List<Integer> iiused = new ArrayList<>();
        List<Integer> iinouse = new ArrayList<>();
        List<Integer> iiexpired = new ArrayList<>();

        // 通过cid匹配
        for (int i = 0; i < cids.size(); i++) {
            for (int i1 = 0; i1 < iused.size(); i1++) {
                Long cid = iused.get(i1).getCid();
                if (cid.equals(cids.get(i))) {
                    iiused.add(iused.get(i1).getCountnum());
                } else {
                    iiused.add(0);
                    break;
                }
            }
        }
        for (int i = 0; i < cids.size(); i++) {
            for (int i1 = 0; i1 < inouse.size(); i1++) {
                Long cid = inouse.get(i1).getCid();
                // 如果id匹配
                if (cid.equals(cids.get(i))) {
                    iinouse.add(inouse.get(i1).getCountnum());
                } else {
                    iinouse.add(0);
                    break;
                }
            }
        }
        for (int i = 0; i < cids.size(); i++) {
            for (int i1 = 0; i1 < iexpired.size(); i1++) {
                Long cid = iexpired.get(i1).getCid();
                // 如果id匹配
                if (cid.equals(cids.get(i))) {
                    iiexpired.add(iexpired.get(i1).getCountnum());
                } else {
                    iiexpired.add(0);
                    break;
                }
            }
        }


        CouponDataVo dataVo = new CouponDataVo();
        dataVo.setTitleText(title_start + time + title_end);
        dataVo.setTotal(totals);
        // TODO 使用的
        dataVo.setUsed(null);
        System.out.println();
        return null;
    }

    /**
     * 查询优惠券列表
     */
    @PreAuthorize("@ss.hasPermi('system:coupon:list')")
    @GetMapping("/list")
    public TableDataInfo list(Coupon coupon) {
        startPage();
        List<CouponVo> list = couponService.selectCouponCardList(coupon);
        return getDataTable(list);
    }

    /**
     * 导出优惠券列表
     */
    @PreAuthorize("@ss.hasPermi('system:coupon:export')")
    @Log(title = "优惠券", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Coupon coupon) {
        List<Coupon> list = couponService.selectCouponList(coupon);
        ExcelUtil<Coupon> util = new ExcelUtil<Coupon>(Coupon.class);
        util.exportExcel(response, list, "优惠券数据");
    }

    /**
     * 获取优惠券详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:coupon:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(couponService.selectCouponById(id));
    }

    /**
     * 新增优惠券
     */
    @PreAuthorize("@ss.hasPermi('system:coupon:add')")
    @Log(title = "优惠券", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Coupon coupon) {
        return toAjax(couponService.insertCoupon(coupon));
    }

    /**
     * 修改优惠券
     */
    @PreAuthorize("@ss.hasPermi('system:coupon:edit')")
    @Log(title = "优惠券", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Coupon coupon) {
        return toAjax(couponService.updateCoupon(coupon));
    }

    /**
     * 删除优惠券
     */
    @PreAuthorize("@ss.hasPermi('system:coupon:remove')")
    @Log(title = "优惠券", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(couponService.deleteCouponByIds(ids));
    }
}
