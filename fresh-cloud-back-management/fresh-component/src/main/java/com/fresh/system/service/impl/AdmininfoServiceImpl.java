package com.fresh.system.service.impl;

import com.fresh.system.domain.Admininfo;
import com.fresh.system.mapper.AdmininfoMapper;
import com.fresh.system.service.IAdmininfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 管理员Service业务层处理
 *
 * @author calyee
 * @date 2023-12-26
 */
@Service
public class AdmininfoServiceImpl implements IAdmininfoService {
    @Autowired
    private AdmininfoMapper admininfoMapper;

    /**
     * 查询管理员
     *
     * @param aid 管理员主键
     * @return 管理员
     */
    @Override
    public Admininfo selectAdmininfoByAid(Long aid) {
        Admininfo admininfo = admininfoMapper.selectAdmininfoByAid(aid);
        admininfo.setPwd("******");
        return admininfo;
    }

    /**
     * 查询管理员列表
     *
     * @param admininfo 管理员
     * @return 管理员
     */
    @Override
    public List<Admininfo> selectAdmininfoList(Admininfo admininfo) {
        List<Admininfo> admininfos = admininfoMapper.selectAdmininfoList(admininfo);
        admininfos.forEach(i -> i.setPwd("******"));
        return admininfos;
    }

    /**
     * 新增管理员
     *
     * @param admininfo 管理员
     * @return 结果
     */
    @Override
    public int insertAdmininfo(Admininfo admininfo) {
        return admininfoMapper.insertAdmininfo(admininfo);
    }

    /**
     * 修改管理员
     *
     * @param admininfo 管理员
     * @return 结果
     */
    @Override
    public int updateAdmininfo(Admininfo admininfo) {
        return admininfoMapper.updateAdmininfo(admininfo);
    }

    /**
     * 批量删除管理员
     *
     * @param aids 需要删除的管理员主键
     * @return 结果
     */
    @Override
    public int deleteAdmininfoByAids(Long[] aids) {
        return admininfoMapper.deleteAdmininfoByAids(aids);
    }

    /**
     * 删除管理员信息
     *
     * @param aid 管理员主键
     * @return 结果
     */
    @Override
    public int deleteAdmininfoByAid(Long aid) {
        return admininfoMapper.deleteAdmininfoByAid(aid);
    }
}
