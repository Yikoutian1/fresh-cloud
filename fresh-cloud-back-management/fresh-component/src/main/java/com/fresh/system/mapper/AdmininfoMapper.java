package com.fresh.system.mapper;

import com.fresh.system.domain.Admininfo;

import java.util.List;

/**
 * 管理员Mapper接口
 * 
 * @author calyee
 * @date 2023-12-26
 */
public interface AdmininfoMapper 
{
    /**
     * 查询管理员
     * 
     * @param aid 管理员主键
     * @return 管理员
     */
    public Admininfo selectAdmininfoByAid(Long aid);

    /**
     * 查询管理员列表
     * 
     * @param admininfo 管理员
     * @return 管理员集合
     */
    public List<Admininfo> selectAdmininfoList(Admininfo admininfo);

    /**
     * 新增管理员
     * 
     * @param admininfo 管理员
     * @return 结果
     */
    public int insertAdmininfo(Admininfo admininfo);

    /**
     * 修改管理员
     * 
     * @param admininfo 管理员
     * @return 结果
     */
    public int updateAdmininfo(Admininfo admininfo);

    /**
     * 删除管理员
     * 
     * @param aid 管理员主键
     * @return 结果
     */
    public int deleteAdmininfoByAid(Long aid);

    /**
     * 批量删除管理员
     * 
     * @param aids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAdmininfoByAids(Long[] aids);
}
