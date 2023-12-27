package com.fresh.system.mapper;

import com.fresh.system.domain.Goodsinfo;

import java.util.List;

/**
 * 商品信息Mapper接口
 * 
 * @author calyee
 * @date 2023-12-26
 */
public interface GoodsinfoMapper 
{
    /**
     * 查询商品信息
     * 
     * @param gno 商品信息主键
     * @return 商品信息
     */
    public Goodsinfo selectGoodsinfoByGno(Long gno);

    /**
     * 查询商品信息列表
     * 
     * @param goodsinfo 商品信息
     * @return 商品信息集合
     */
    public List<Goodsinfo> selectGoodsinfoList(Goodsinfo goodsinfo);

    /**
     * 新增商品信息
     * 
     * @param goodsinfo 商品信息
     * @return 结果
     */
    public int insertGoodsinfo(Goodsinfo goodsinfo);

    /**
     * 修改商品信息
     * 
     * @param goodsinfo 商品信息
     * @return 结果
     */
    public int updateGoodsinfo(Goodsinfo goodsinfo);

    /**
     * 删除商品信息
     * 
     * @param gno 商品信息主键
     * @return 结果
     */
    public int deleteGoodsinfoByGno(Long gno);

    /**
     * 批量删除商品信息
     * 
     * @param gnos 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGoodsinfoByGnos(Long[] gnos);
}
