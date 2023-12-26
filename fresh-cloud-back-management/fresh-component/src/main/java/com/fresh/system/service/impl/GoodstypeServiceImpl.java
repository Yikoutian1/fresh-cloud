package com.fresh.system.service.impl;

import com.fresh.system.domain.Goodstype;
import com.fresh.system.mapper.GoodstypeMapper;
import com.fresh.system.service.IGoodstypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品类型Service业务层处理
 * 
 * @author calyee
 * @date 2023-12-26
 */
@Service
public class GoodstypeServiceImpl implements IGoodstypeService 
{
    @Autowired
    private GoodstypeMapper goodstypeMapper;

    /**
     * 查询商品类型
     * 
     * @param tno 商品类型主键
     * @return 商品类型
     */
    @Override
    public Goodstype selectGoodstypeByTno(Long tno)
    {
        return goodstypeMapper.selectGoodstypeByTno(tno);
    }

    /**
     * 查询商品类型列表
     * 
     * @param goodstype 商品类型
     * @return 商品类型
     */
    @Override
    public List<Goodstype> selectGoodstypeList(Goodstype goodstype)
    {
        return goodstypeMapper.selectGoodstypeList(goodstype);
    }

    /**
     * 新增商品类型
     * 
     * @param goodstype 商品类型
     * @return 结果
     */
    @Override
    public int insertGoodstype(Goodstype goodstype)
    {
        return goodstypeMapper.insertGoodstype(goodstype);
    }

    /**
     * 修改商品类型
     * 
     * @param goodstype 商品类型
     * @return 结果
     */
    @Override
    public int updateGoodstype(Goodstype goodstype)
    {
        return goodstypeMapper.updateGoodstype(goodstype);
    }

    /**
     * 批量删除商品类型
     * 
     * @param tnos 需要删除的商品类型主键
     * @return 结果
     */
    @Override
    public int deleteGoodstypeByTnos(Long[] tnos)
    {
        return goodstypeMapper.deleteGoodstypeByTnos(tnos);
    }

    /**
     * 删除商品类型信息
     * 
     * @param tno 商品类型主键
     * @return 结果
     */
    @Override
    public int deleteGoodstypeByTno(Long tno)
    {
        return goodstypeMapper.deleteGoodstypeByTno(tno);
    }
}
