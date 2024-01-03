package com.fresh.chat.service;

import com.fresh.chat.bean.Memberinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberInfoService {
    public List<String> findAllUsers();
}
