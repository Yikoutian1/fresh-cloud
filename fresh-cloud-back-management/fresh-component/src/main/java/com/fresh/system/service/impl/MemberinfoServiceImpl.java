package com.fresh.system.service.impl;

import com.fresh.system.domain.Memberinfo;
import com.fresh.system.mapper.MemberinfoMapper;
import com.fresh.system.service.IMemberinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 会员Service业务层处理
 *
 * @author calyee
 * @date 2023-12-26
 */
@Service
public class MemberinfoServiceImpl implements IMemberinfoService {
    @Autowired
    private MemberinfoMapper memberinfoMapper;

    /**
     * 查询会员
     *
     * @param mno 会员主键
     * @return 会员
     */
    @Override
    public Memberinfo selectMemberinfoByMno(Long mno) {
        return memberinfoMapper.selectMemberinfoByMno(mno);
    }

    /**
     * 查询会员列表
     *
     * @param memberinfo 会员
     * @return 会员
     */
    @Override
    public List<Memberinfo> selectMemberinfoList(Memberinfo memberinfo) {
        List<Memberinfo> memberinfos = memberinfoMapper.selectMemberinfoList(memberinfo);
        memberinfos = memberinfos.stream().map(item -> {
            item.setPwd("******");
            return item;
        }).collect(Collectors.toList());
        return memberinfos;
    }

    /**
     * 新增会员
     *
     * @param memberinfo 会员
     * @return 结果
     */
    @Override
    public int insertMemberinfo(Memberinfo memberinfo) {
        return memberinfoMapper.insertMemberinfo(memberinfo);
    }

    /**
     * 修改会员
     *
     * @param memberinfo 会员
     * @return 结果
     */
    @Override
    public int updateMemberinfo(Memberinfo memberinfo) {
        return memberinfoMapper.updateMemberinfo(memberinfo);
    }

    /**
     * 批量删除会员
     *
     * @param mnos 需要删除的会员主键
     * @return 结果
     */
    @Override
    public int deleteMemberinfoByMnos(Long[] mnos) {
        return memberinfoMapper.deleteMemberinfoByMnos(mnos);
    }

    /**
     * 删除会员信息
     *
     * @param mno 会员主键
     * @return 结果
     */
    @Override
    public int deleteMemberinfoByMno(Long mno) {
        return memberinfoMapper.deleteMemberinfoByMno(mno);
    }
}
