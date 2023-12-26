package com.fresh.system.service.impl;

import com.fresh.system.domain.Cartinfo;
import com.fresh.system.mapper.CartinfoMapper;
import com.fresh.system.service.ICartinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 购物车信息Service业务层处理
 * 
 * @author calyee
 * @date 2023-12-26
 */
@Service
public class CartinfoServiceImpl implements ICartinfoService 
{
    @Autowired
    private CartinfoMapper cartinfoMapper;

    /**
     * 查询购物车信息
     * 
     * @param cno 购物车信息主键
     * @return 购物车信息
     */
    @Override
    public Cartinfo selectCartinfoByCno(String cno)
    {
        return cartinfoMapper.selectCartinfoByCno(cno);
    }

    /**
     * 查询购物车信息列表
     * 
     * @param cartinfo 购物车信息
     * @return 购物车信息
     */
    @Override
    public List<Cartinfo> selectCartinfoList(Cartinfo cartinfo)
    {
        return cartinfoMapper.selectCartinfoList(cartinfo);
    }

    /**
     * 新增购物车信息
     * 
     * @param cartinfo 购物车信息
     * @return 结果
     */
    @Override
    public int insertCartinfo(Cartinfo cartinfo)
    {
        return cartinfoMapper.insertCartinfo(cartinfo);
    }

    /**
     * 修改购物车信息
     * 
     * @param cartinfo 购物车信息
     * @return 结果
     */
    @Override
    public int updateCartinfo(Cartinfo cartinfo)
    {
        return cartinfoMapper.updateCartinfo(cartinfo);
    }

    /**
     * 批量删除购物车信息
     * 
     * @param cnos 需要删除的购物车信息主键
     * @return 结果
     */
    @Override
    public int deleteCartinfoByCnos(String[] cnos)
    {
        return cartinfoMapper.deleteCartinfoByCnos(cnos);
    }

    /**
     * 删除购物车信息信息
     * 
     * @param cno 购物车信息主键
     * @return 结果
     */
    @Override
    public int deleteCartinfoByCno(String cno)
    {
        return cartinfoMapper.deleteCartinfoByCno(cno);
    }
}
