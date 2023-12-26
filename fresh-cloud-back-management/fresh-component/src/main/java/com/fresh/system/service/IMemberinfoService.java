package com.fresh.system.service;

import com.fresh.system.domain.Memberinfo;

import java.util.List;

/**
 * 会员Service接口
 * 
 * @author calyee
 * @date 2023-12-26
 */
public interface IMemberinfoService 
{
    /**
     * 查询会员
     * 
     * @param mno 会员主键
     * @return 会员
     */
    public Memberinfo selectMemberinfoByMno(Long mno);

    /**
     * 查询会员列表
     * 
     * @param memberinfo 会员
     * @return 会员集合
     */
    public List<Memberinfo> selectMemberinfoList(Memberinfo memberinfo);

    /**
     * 新增会员
     * 
     * @param memberinfo 会员
     * @return 结果
     */
    public int insertMemberinfo(Memberinfo memberinfo);

    /**
     * 修改会员
     * 
     * @param memberinfo 会员
     * @return 结果
     */
    public int updateMemberinfo(Memberinfo memberinfo);

    /**
     * 批量删除会员
     * 
     * @param mnos 需要删除的会员主键集合
     * @return 结果
     */
    public int deleteMemberinfoByMnos(Long[] mnos);

    /**
     * 删除会员信息
     * 
     * @param mno 会员主键
     * @return 结果
     */
    public int deleteMemberinfoByMno(Long mno);
}
