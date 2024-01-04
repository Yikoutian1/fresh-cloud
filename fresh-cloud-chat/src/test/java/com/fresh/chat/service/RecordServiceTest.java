package com.fresh.chat.service;


import com.fresh.chat.ChatApplication;
import com.fresh.chat.bean.Record;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
        record.setUid(10000);
        record.setName("用户10000");
        record.setText("测试mongo2");
        record.setObjId(2);
        record.setReceive("管理员2");
        record.setSendTime(new Date());
        recordService.insertRecord(record);
    }

    @Test
    public void getRecords() {
        List<Record> records = recordService.getRecords(10000, null);
        System.out.println(records);
    }
}