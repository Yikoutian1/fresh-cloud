package com.fresh.chat.service;

import com.fresh.chat.bean.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.ArrayOperators;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @ClassName RecordService
 * @Description 聊天记录
 * @Author Calyee
 * @DATE 2024/01/04 004 16:46
 * @Version 1.0
 */
@Service
public class RecordService {
    @Autowired
    private MongoTemplate mongoTemplate;

    public void initMongo() {
        if (!mongoTemplate.collectionExists(Record.class)) {
            mongoTemplate.createCollection(Record.class);
        }
    }

    /**
     * 获取两人间的聊天记录
     *
     * @param id 消息发送者，接受者
     * @return 二者的聊天记录
     */
    public Map<String, List<Record>> getRecords(Integer id, Integer objId) {

        // select (fromName = a and toName = b) || (fromName = b and toName = a)

        // one part ...
        // two part ...
        // or Operator ...
        Query query = new Query();
        Criteria criteria = new Criteria();
        criteria.orOperator(Criteria.where("fromName").is(id).and("toName").is(objId),
                Criteria.where("fromName").is(objId).and("toName").is(id));
        query.addCriteria(criteria);

        List<Record> records = mongoTemplate.find(query, Record.class, "record");

        return null;
    }


    /**
     * 插入聊天记录
     *
     * @param record 一条聊天记录
     * @return
     */
    public Map<String, Object> insertRecord(Record record) {
        mongoTemplate.save(record, "record");
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Record inserted successfully");
        response.put("record", record);
        return response;
    }

    public Map<String, Object> insertRecords(List<Record> records) {
        // ...
        return null;
    }
}
