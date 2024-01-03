package com.fresh.client;

import com.fresh.config.ClientConfiguration;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@FeignClient(value = "chat-server", configuration = ClientConfiguration.class)
public interface ChatClient {


}
