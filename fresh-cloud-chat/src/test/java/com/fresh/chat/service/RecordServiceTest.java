package com.fresh.chat.service;


import com.fresh.chat.ChatApplication;
import com.fresh.chat.bean.Record;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@SpringBootTest(classes = ChatApplication.class)
public class RecordServiceTest {
    @Autowired
    private RecordService recordService;

    @Test
    public void testInitMongo() {
        recordService.initMongo();
    }

    @Test
    public void insertRecord() {
        Record record = new Record();
        record.setId(10000);
        record.setName("用户10000");
        record.setText("测试mongo");
        record.setObjId(1);
        record.setReceive("管理员1");
        record.setSendTime(new Date());
        recordService.insertRecord(record);
    }
}