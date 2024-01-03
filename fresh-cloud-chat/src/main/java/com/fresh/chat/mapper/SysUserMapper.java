package com.fresh.chat.mapper;

import com.fresh.chat.bean.Sys_User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SysUserMapper {
    @Select("select user_name from sys_user")
    public List<String> findAllManagers();

}
