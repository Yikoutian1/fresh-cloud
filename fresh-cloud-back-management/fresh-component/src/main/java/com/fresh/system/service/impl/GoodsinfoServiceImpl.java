package com.fresh.system.service.impl;

import com.fresh.system.domain.Goodsinfo;
import com.fresh.system.mapper.GoodsinfoMapper;
import com.fresh.system.service.IGoodsinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品信息Service业务层处理
 * 
 * @author calyee
 * @date 2023-12-26
 */
@Service
public class GoodsinfoServiceImpl implements IGoodsinfoService 
{
    @Autowired
    private GoodsinfoMapper goodsinfoMapper;

    /**
     * 查询商品信息
     * 
     * @param gno 商品信息主键
     * @return 商品信息
     */
    @Override
    public Goodsinfo selectGoodsinfoByGno(Long gno)
    {
        return goodsinfoMapper.selectGoodsinfoByGno(gno);
    }

    /**
     * 查询商品信息列表
     * 
     * @param goodsinfo 商品信息
     * @return 商品信息
     */
    @Override
    public List<Goodsinfo> selectGoodsinfoList(Goodsinfo goodsinfo)
    {
        return goodsinfoMapper.selectGoodsinfoList(goodsinfo);
    }

    /**
     * 新增商品信息
     * 
     * @param goodsinfo 商品信息
     * @return 结果
     */
    @Override
    public int insertGoodsinfo(Goodsinfo goodsinfo)
    {
        return goodsinfoMapper.insertGoodsinfo(goodsinfo);
    }

    /**
     * 修改商品信息
     * 
     * @param goodsinfo 商品信息
     * @return 结果
     */
    @Override
    public int updateGoodsinfo(Goodsinfo goodsinfo)
    {
        return goodsinfoMapper.updateGoodsinfo(goodsinfo);
    }

    /**
     * 批量删除商品信息
     * 
     * @param gnos 需要删除的商品信息主键
     * @return 结果
     */
    @Override
    public int deleteGoodsinfoByGnos(Long[] gnos)
    {
        return goodsinfoMapper.deleteGoodsinfoByGnos(gnos);
    }

    /**
     * 删除商品信息信息
     * 
     * @param gno 商品信息主键
     * @return 结果
     */
    @Override
    public int deleteGoodsinfoByGno(Long gno)
    {
        return goodsinfoMapper.deleteGoodsinfoByGno(gno);
    }
}
