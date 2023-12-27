package com.fresh.system.service.impl;

import com.fresh.system.domain.Addrinfo;
import com.fresh.system.mapper.AddrinfoMapper;
import com.fresh.system.service.IAddrinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 地址信息Service业务层处理
 * 
 * @author calyee
 * @date 2023-12-26
 */
@Service
public class AddrinfoServiceImpl implements IAddrinfoService 
{
    @Autowired
    private AddrinfoMapper addrinfoMapper;

    /**
     * 查询地址信息
     * 
     * @param ano 地址信息主键
     * @return 地址信息
     */
    @Override
    public Addrinfo selectAddrinfoByAno(String ano)
    {
        return addrinfoMapper.selectAddrinfoByAno(ano);
    }

    /**
     * 查询地址信息列表
     * 
     * @param addrinfo 地址信息
     * @return 地址信息
     */
    @Override
    public List<Addrinfo> selectAddrinfoList(Addrinfo addrinfo)
    {
        return addrinfoMapper.selectAddrinfoList(addrinfo);
    }

    /**
     * 新增地址信息
     * 
     * @param addrinfo 地址信息
     * @return 结果
     */
    @Override
    public int insertAddrinfo(Addrinfo addrinfo)
    {
        return addrinfoMapper.insertAddrinfo(addrinfo);
    }

    /**
     * 修改地址信息
     * 
     * @param addrinfo 地址信息
     * @return 结果
     */
    @Override
    public int updateAddrinfo(Addrinfo addrinfo)
    {
        return addrinfoMapper.updateAddrinfo(addrinfo);
    }

    /**
     * 批量删除地址信息
     * 
     * @param anos 需要删除的地址信息主键
     * @return 结果
     */
    @Override
    public int deleteAddrinfoByAnos(String[] anos)
    {
        return addrinfoMapper.deleteAddrinfoByAnos(anos);
    }

    /**
     * 删除地址信息信息
     * 
     * @param ano 地址信息主键
     * @return 结果
     */
    @Override
    public int deleteAddrinfoByAno(String ano)
    {
        return addrinfoMapper.deleteAddrinfoByAno(ano);
    }
}
