package com.fresh.chat.service.Impl;

import com.fresh.chat.bean.Memberinfo;
import com.fresh.chat.mapper.MemberInfoMapper;
import com.fresh.chat.service.MemberInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberInfoServiceImpl implements MemberInfoService {
    @Autowired
    private MemberInfoMapper memberInfoMapper;


    @Override
    public List<String> findAllUsers() {
        List<String> list = memberInfoMapper.findAllUsers();
        return list;
    }
}
