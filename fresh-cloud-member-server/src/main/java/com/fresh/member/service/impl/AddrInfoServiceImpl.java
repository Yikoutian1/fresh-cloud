package com.fresh.member.service.impl;


import com.fresh.common.entity.AddrInfo;
import com.fresh.common.util.StringUtil;
import com.fresh.member.mapper.IAddrInfoMapper;
import com.fresh.member.service.IAddrInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: yc-fresh-cloud
 */
@Primary
@Service
public class AddrInfoServiceImpl implements IAddrInfoService {

    @Autowired
    private IAddrInfoMapper mapper;

    // @Transactional
    @Override
    public int add(AddrInfo af) {
        if (StringUtil.checkNull(af.getAno(), af.getProvince(), af.getCity(), af.getArea(), af.getName(), af.getTel())) {
            return -2;
        }
        // int result = mapper.update(af.getMno());// 如果新添加的地址不需要设置为默认收货地址，则可以不要这个
        int result= mapper.add(af);
        return result;
    }

    @Override
    public int update(String[] anos) {
        if (anos.length < 1) {
            return -2;
        }
        return mapper.updates(anos);
    }

    @Override
    public List<AddrInfo> findByMno(int mno) {
        return mapper.findByMno(mno);
    }
}
