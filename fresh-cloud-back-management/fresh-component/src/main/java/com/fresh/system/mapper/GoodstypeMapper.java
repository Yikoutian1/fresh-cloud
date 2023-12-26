package com.fresh.system.mapper;

import com.fresh.system.domain.Goodstype;

import java.util.List;

/**
 * 商品类型Mapper接口
 * 
 * @author calyee
 * @date 2023-12-26
 */
public interface GoodstypeMapper 
{
    /**
     * 查询商品类型
     * 
     * @param tno 商品类型主键
     * @return 商品类型
     */
    public Goodstype selectGoodstypeByTno(Long tno);

    /**
     * 查询商品类型列表
     * 
     * @param goodstype 商品类型
     * @return 商品类型集合
     */
    public List<Goodstype> selectGoodstypeList(Goodstype goodstype);

    /**
     * 新增商品类型
     * 
     * @param goodstype 商品类型
     * @return 结果
     */
    public int insertGoodstype(Goodstype goodstype);

    /**
     * 修改商品类型
     * 
     * @param goodstype 商品类型
     * @return 结果
     */
    public int updateGoodstype(Goodstype goodstype);

    /**
     * 删除商品类型
     * 
     * @param tno 商品类型主键
     * @return 结果
     */
    public int deleteGoodstypeByTno(Long tno);

    /**
     * 批量删除商品类型
     * 
     * @param tnos 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGoodstypeByTnos(Long[] tnos);
}
