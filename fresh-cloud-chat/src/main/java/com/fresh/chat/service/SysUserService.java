package com.fresh.chat.service;

import com.fresh.chat.bean.Sys_User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserService {
    public List<String> findAllManagers();
}
