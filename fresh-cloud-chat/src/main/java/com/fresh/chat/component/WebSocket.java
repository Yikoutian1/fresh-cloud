package com.fresh.chat.component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fresh.chat.bean.Record;
import com.fresh.chat.service.Impl.MemberInfoServiceImpl;
import com.fresh.chat.service.Impl.SysUserServiceImpl;
import com.fresh.chat.service.MemberInfoService;
import com.fresh.chat.service.RecordService;
import com.fresh.chat.service.SysUserService;
import com.fresh.client.ChatClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

//@Slf4j
//@Component
//@ServerEndpoint("/websocket/{username}/{status}") //该类定义为WebSocket服务器端点 值为WebSocket的URI路径
//public class WebSocket {
//
//    @Autowired
//    private MemberInfoService memberInfoService;
//
//    @Autowired
//    private SysUserService sysUserService;
//
//    /**
//     * 在线人数
//     */
//    public static int onlineNumber = 0;
//    /**
//     * 管理员数量唯一标识
//     */
//    public static int online_admins = 0;
//    /**
//     * 用户数量唯一标识
//     */
//    public static Integer online_users = 0;
//    /**
//     * 前台用户
//     */
//    private static Map<String, WebSocket> clients = new ConcurrentHashMap<String, WebSocket>();
//    /**
//     * 后台管理员
//     */
//    private static Map<String, WebSocket> managers = new ConcurrentHashMap<String, WebSocket>();
//    /**
//     * session
//     */
//    private static Map<String, Session> sessions = new ConcurrentHashMap<String, Session>();
//    /**
//     * 会话
//     */
//    private Session session;
//    /**
//     * 用户名称
//     */
//    private String username;
//
//    private String status;
//
//    /**
//     * OnOpen 表示有浏览器链接过来的时候被调用
//     * OnClose 表示浏览器发出关闭请求的时候被调用
//     * OnMessage 表示浏览器发消息的时候被调用
//     * OnError 表示有错误发生，比如网络断开了等等
//     */
//    public static final String ADMIN_STATUS = "0";
//    public static final String USER_STATUS = "1";
//
//    /**
//     * 建立连接
//     *
//     * @param session
//     */
//    @OnOpen
//    public void onOpen(@PathParam("username") String username,
//                       @PathParam("status") String status,
//                       Session session) {
//        Map<String, Object> result = new HashMap<>();
//        // 所有在线用户数量
//        onlineNumber++;
//        // user: 1, admin: 0
////        log.info("[status]: {}",status);
//        log.info("现在来连接的客户id：" + session.getId() + "用户名：" + username);
//        this.username = username;
//        this.session = session;
//        this.status = status;
//        sessions.put(username,session);
//
//        log.info("有新连接加入！ 当前在线人数" + onlineNumber);
//        try {
//            //messageType 1代表上线 2代表下线 3代表在线名单 4代表普通消息
//            //先给所有人发送通知，说我上线了
//            Map<String, Object> map1 = new HashMap<>();
//            map1.put("messageType", 1);
//            map1.put("username", username);
//            //将消息发送所有连接的用户告知他们我已经上线
//            sendMessageAll(JSON.toJSONString(map1), username, status);
//            if (ADMIN_STATUS.equals(status)) {
//                // 管理员在线数量
//                online_admins++;
//                managers.put(username, this);
//                log.info("[managers put]:{}", managers);
//                //移除掉自己，获取除自己以外的用户集合
//                Set<String> set_users = clients.keySet();
//                log.info("[onlineUsers]:{}", set_users);
//                result.put("onlineUsers", set_users);
//            }
//            if (USER_STATUS.equals(status)) {
//                // 用户在线数量
//                online_users++;
//                clients.put(username, this);
//                log.info("[clients put]:{}", clients);
//                Set<String> set_managers = managers.keySet();
//                log.info("[onlineManagers]:{}", set_managers);
//                result.put("onlineManagers", set_managers);
//            }
//            log.info("[final object]: {}", result);
//            log.info("[onlineUsers--]:{}", clients.keySet());
//            log.info("[onlineManagers]:{}", managers.keySet());
//            result.put("messageType", 3);
//            sendMessageTo(JSON.toJSONString(result), username, status);
//            System.out.println("JSON.toJSONString(result) = " + JSON.toJSONString(result));
//            //给自己发一条消息：告诉自己现在都有谁在线
//        } catch (IOException e) {
//            log.info(username + "上线的时候通知所有人发生了错误");
//        }
//
//
//    }
//
//
//    /**
//     * 收到客户端的消息
//     *
//     * @param message 消息
//     * @param session 会话
//     */
//    @OnMessage
//    public void onMessage(String message, Session session) {
//        try {
//            log.info("来自客户端消息：" + message + "客户端的id是：" + session.getId());
//            JSONObject jsonObject = JSON.parseObject(message);
//            String textMessage = jsonObject.getString("message");
//            String fromusername = jsonObject.getString("username");
//            String tousername = jsonObject.getString("to");
//            // 判断角色 0:用户 1:后台
//            String role = jsonObject.getString("url").substring(jsonObject.getString("url").length() - 1);
////            log.info("[role]:{}",role);
//            //如果不是发给所有，那么就发给某一个人
//            //messageType 1代表上线 2代表下线 3代表在线名单  4代表普通消息
//            Map<String, Object> map1 = new HashMap<>();
//            map1.put("messageType", 4);
//            map1.put("textMessage", textMessage);
//            map1.put("fromusername", fromusername);
//            if (tousername.equals("All")) {
//                map1.put("tousername", "所有人");
//                sendMessageAll(JSON.toJSONString(map1), fromusername);
//            } else {
//                map1.put("tousername", tousername);
//                sendMessageTo(JSON.toJSONString(map1), tousername, role);
//            }
//        } catch (Exception e) {
//            log.error("发生了错误了");
//        }
//    }
//
//
//    /**
//     * 工具状态发信息
//     *
//     * @param message
//     * @param ToUserName
//     * @param status
//     * @throws IOException
//     */
//    public void sendMessageTo(String message, String ToUserName, String status) throws IOException {
//        log.info("message:{},username:{},status:{}", message, ToUserName, status);
//        if (ADMIN_STATUS.equals(status)) {
//            for (WebSocket item : clients.values()) {
//                if (item.username.equals(ToUserName)) {
//                    log.info("item.username={}", item.username);
//                    item.session.getAsyncRemote().sendText(message);
//                    break;
//                }
//            }
//        }
//        if (USER_STATUS.equals(status)) {
//            for (WebSocket item : managers.values()) {
//                if (item.username.equals(ToUserName)) {
//                    log.info("item.username={}", item.username);
//                    item.session.getAsyncRemote().sendText(message);
//                    break;
//                }
//            }
//        }
//
//    }
//
//    public void sendMessageTo(String message, String ToUserName) throws IOException {
//        for (WebSocket item : clients.values()) {
//            if (item.username.equals(ToUserName)) {
//                item.session.getAsyncRemote().sendText(message);
//                break;
//            }
//        }
//    }
//
//    public void sendMessageAll(String message, String FromUserName, String status) throws IOException {
//        if (ADMIN_STATUS.equals(status)) {
//            //将消息发送给所有连接的用户
//            for (WebSocket item : clients.values()) {
//                item.session.getAsyncRemote().sendText(message);
//            }
//        }
//        if (USER_STATUS.equals(status)) {
//            //将消息发送给所有连接的用户
//            for (WebSocket item : managers.values()) {
//                item.session.getAsyncRemote().sendText(message);
//            }
//        }
//    }
//
//    public void sendMessageAll(String message, String FromUserName) throws IOException {
//        //将消息发送给所有连接的用户
//        for (WebSocket item : clients.values()) {
//            item.session.getAsyncRemote().sendText(message);
//        }
//        for (WebSocket item : managers.values()) {
//            item.session.getAsyncRemote().sendText(message);
//        }
//    }
//
//    public static synchronized int getOnlineCount() {
//        return onlineNumber;
//    }
//
//
//    @OnError
//    public void onError(Session session, Throwable error) {
//        log.info("服务端发生了错误" + error.getMessage());
//        //error.printStackTrace();
//    }
//
//    /**
//     * 连接关闭
//     */
//    @OnClose
//    public void onClose() {
//        onlineNumber--;
//        //webSockets.remove(this);
//        clients.remove(username);
//        managers.remove(username);
//        try {
//            //messageType 1代表上线 2代表下线 3代表在线名单  4代表普通消息
//            if (status.equals(ADMIN_STATUS)){
//                Map<String, Object> map1 = new HashMap<>();
//                map1.put("messageType", 2);
//                map1.put("onlineManagers", managers.keySet());
//                map1.put("username", username);
//                sendMessageAll(JSON.toJSONString(map1), username);
//            }
//            if (this.status.equals(USER_STATUS)){
//                Map<String, Object> map1 = new HashMap<>();
//                map1.put("messageType", 2);
//                map1.put("onlineUsers", clients.keySet());
//                map1.put("username", username);
//                sendMessageAll(JSON.toJSONString(map1), username);
//            }
//        } catch (IOException e) {
//            log.info(username + "下线的时候通知所有人发生了错误");
//        }
//        log.info("有连接关闭！ 当前在线人数" + onlineNumber);
//    }
//
//
//}

@Slf4j
@Component
@ServerEndpoint("/websocket/{role}/{username}")
public class WebSocket {
    public static final String ADMIN_STATUS = "connectManager";
    public static final String USER_STATUS = "connectUser";
    /**
     * 在线人数
     */
    public static int onlineNumber = 0;
    /**
     * 以用户的姓名为key，WebSocket为对象保存起来
     */
    private static Map<String, WebSocket> clients = new ConcurrentHashMap<String, WebSocket>();
    private static Map<String, WebSocket> managers = new ConcurrentHashMap<String, WebSocket>();
    /**
     * 会话
     */
    private Session session;
    /**
     * 用户名称
     */
    private String username;

    /**
     * OnOpen 表示有浏览器链接过来的时候被调用
     * OnClose 表示浏览器发出关闭请求的时候被调用
     * OnMessage 表示浏览器发消息的时候被调用
     * OnError 表示有错误发生，比如网络断开了等等
     */

    /**
     * 建立连接
     *
     * @param session
     */
    @OnOpen
    public void onOpen(@PathParam("username") String username, @PathParam("role") String role, Session session) {
        onlineNumber++;
//        String role = session.getRequestURI().toString();
        log.info("现在来连接的客户id：{},用户名: {}, 角色: {}", session.getId(), username, role);
        this.username = username;
        log.info("[username]: {}", username);
        this.session = session;
        log.info("有新连接加入！ 当前在线人数" + onlineNumber);
        try {
            //messageType 1代表上线 2代表下线 3代表在线名单 4代表普通消息
            //先给所有人发送通知，说我上线了
//            Map<String, Object> map1 = new HashMap<>();
            Map<String, Object> map2 = new HashMap<>();
//            map1.put("messageType", 1);
//            map1.put("username", username);
//            sendMessageAll(JSON.toJSONString(map1), username);
            // 处理列表
            if (ADMIN_STATUS.equals(role)) {
                managers.put(username, this);
                log.info("[后台分支]:用户名为: {}, 列表为: {}", username, managers);
            }
            if (USER_STATUS.equals(role)) {
                log.info("[用户分支]::用户名为: {}, 列表为: {}", username, clients);
                //把自己的信息加入到map当中去
                clients.put(username, this);
            }
            // 处理回送的消息
            if (USER_STATUS.equals(role)) {
                Set<String> set = managers.keySet();
                map2.put("onlineManagers", set);
            }
            if (ADMIN_STATUS.equals(role)) {
                Set<String> set = clients.keySet();
                map2.put("onlineUsers", set);
            }
            //给自己发一条消息：告诉自己现在都有谁在线
            map2.put("messageType", 3);
            log.info("[所有用户列表]:sendMsg: {}, 客户端: {},后台: {}", map2, clients.keySet(), managers.keySet());
            //移除掉自己
            sendMessageTo(JSON.toJSONString(map2), username, role);
        } catch (IOException e) {
            log.info(username + "上线的时候通知所有人发生了错误");
        }


    }


    /**
     * 收到客户端的消息
     *
     * @param message 消息
     * @param session 会话
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        try {
            log.info("来自客户端消息：" + message + "客户端的id是：" + session.getId());
            JSONObject jsonObject = JSON.parseObject(message);
            String textMessage = jsonObject.getString("message");
            String fromusername = jsonObject.getString("username");
            String tousername = jsonObject.getString("to");
            String role = jsonObject.getString("url").substring(jsonObject.getString("url").length() - 1);
            //如果不是发给所有，那么就发给某一个人
            //messageType 1代表上线 2代表下线 3代表在线名单  4代表普通消息
            Map<String, Object> map1 = new HashMap<>();
            map1.put("messageType", 4);
            map1.put("textMessage", textMessage);
            map1.put("fromusername", fromusername);
//            if (tousername.equals("All")) {
//                map1.put("tousername", "所有人");
//                sendMessageAll(JSON.toJSONString(map1), fromusername);
//            } else {
            map1.put("tousername", tousername);
            sendMessageTo(JSON.toJSONString(map1), tousername, role);
//            }
        } catch (Exception e) {
            log.info("发生了错误了");
        }
    }

    @Autowired
    private RecordService recordService;

    public void sendMessageTo(String message, String ToUserName, String role) throws IOException {
        List<WebSocket> all = new ArrayList<>();
        all.addAll(clients.values());
        all.addAll(managers.values());
        for (WebSocket webSocket : all) {
            if (ToUserName.equals(webSocket.username)) {
                webSocket.session.getAsyncRemote().sendText(message);
//                Record record = new Record();
//                record.setText(message);
//                // TODO 发送者id name
//                record.setUid(1);
//                record.setName("");
//
//                record.setReceive(ToUserName);
//                // TODO 管理员id
//                record.setObjId(1);
//                record.setSendTime(new Date());
//                // 插入聊天
//                recordService.insertRecord(record);
                return;
            }
        }
//        for (WebSocket item : clients.values()) {
//            if (ToUserName.equals(item.username)) {
//                item.session.getAsyncRemote().sendText(message);
//                return;
//            }
//        }
//        for (WebSocket item : managers.values()) {
//            if (ToUserName.equals(item.username)) {
//                item.session.getAsyncRemote().sendText(message);
//                return;
//            }
//        }
    }

    public void sendMessageAll(String message, String FromUserName) throws IOException {
        for (WebSocket item : clients.values()) {
            item.session.getAsyncRemote().sendText(message);
        }
        for (WebSocket item : managers.values()) {
            item.session.getAsyncRemote().sendText(message);
        }
    }

    public static synchronized int getOnlineCount() {
        return onlineNumber;
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.info("服务端发生了错误" + error.getMessage());
        //error.printStackTrace();
    }

    /**
     * 连接关闭
     */
    @OnClose
    public void onClose() {
        onlineNumber--;
        //webSockets.remove(this);
        // 退出聊天删除
        clients.remove(username);
        managers.remove(username);
        try {
            //messageType 1代表上线 2代表下线 3代表在线名单  4代表普通消息
            Map<String, Object> map1 = new HashMap<>();
            map1.put("messageType", 2);
            map1.put("onlineUsers", clients.keySet());
            map1.put("onlineManagers", managers.keySet());
            map1.put("username", username);
            sendMessageAll(JSON.toJSONString(map1), username);
        } catch (IOException e) {
            log.info(username + "下线的时候通知所有人发生了错误");
        }
        log.info("有连接关闭！ 当前在线人数" + onlineNumber);
    }
}