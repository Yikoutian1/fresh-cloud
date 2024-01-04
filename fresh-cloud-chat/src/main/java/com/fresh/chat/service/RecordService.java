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
     * @param uid 消息发送者，接受者
     * @return 二者的聊天记录
     */
    public List<Record> getRecords(Integer uid, Integer objId) {

        // select (fromName = a and toName = b) || (fromName = b and toName = a)

        // one part ...
        // two part ...
        // or Operator ...
        Query query = new Query();
        Criteria criteria = new Criteria();
        if (null == objId) {
            criteria.orOperator(Criteria.where("uid").is(uid));
        } else {
            criteria.orOperator(Criteria.where("uid").is(uid).and("objId").is(objId),
                    Criteria.where("objId").is(objId).and("uid").is(uid));
        }
        query.addCriteria(criteria);
        List<Record> records = mongoTemplate.find(query, Record.class, "record");
        return records;
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
