package com.fresh.chat.mapper;

import com.fresh.chat.bean.Memberinfo;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MemberInfoMapper {
    @Select("select nickName from memberinfo")
    public List<String> findAllUsers();
}
