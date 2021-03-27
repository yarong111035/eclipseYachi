package _01_config;


import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import _10_member.controller.MyWebSocketHandler;


@Configuration
@EnableWebSocket
@Controller
public class WebSocketConfig implements WebSocketConfigurer {

    @Autowired
    private MyWebSocketHandler myWebSocketHandler;

//    @Override
//    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
//        registry.addHandler(myWebSocketHandler, "/socketHandler").setAllowedOrigins("*");
//    }
    
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {

        registry.addHandler(myWebSocketHandler(),"/websocket/socketServer.do").addInterceptors(new SpringWebSocketHandlerInterceptor());

        registry.addHandler(myWebSocketHandler(), "/sockjs/socketServer.do").addInterceptors(new SpringWebSocketHandlerInterceptor()).withSockJS();

    }
    
    

    
    @Bean
    public TextWebSocketHandler myWebSocketHandler() {
    	return new MyWebSocketHandler();
    }
}
