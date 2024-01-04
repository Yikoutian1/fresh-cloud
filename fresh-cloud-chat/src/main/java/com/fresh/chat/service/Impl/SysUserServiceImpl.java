package com.fresh.chat.service.Impl;

import com.fresh.chat.bean.Sys_User;
import com.fresh.chat.mapper.SysUserMapper;
import com.fresh.chat.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    public List<String> findAllManagers() {
        List<String> list = sysUserMapper.findAllManagers();
        return list;
    }
}
