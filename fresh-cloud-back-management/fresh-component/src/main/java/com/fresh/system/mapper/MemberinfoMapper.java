package com.fresh.system.mapper;

import com.fresh.system.domain.Memberinfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 会员Mapper接口
 *
 * @author calyee
 * @date 2023-12-26
 */
@Mapper
public interface MemberinfoMapper {
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
     * 删除会员
     *
     * @param mno 会员主键
     * @return 结果
     */
    public int deleteMemberinfoByMno(Long mno);

    /**
     * 批量删除会员
     *
     * @param mnos 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMemberinfoByMnos(Long[] mnos);
}
