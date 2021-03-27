package _01_config;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class SpringWebSocketHandlerInterceptor extends HttpSessionHandshakeInterceptor {
	   @Override

	    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,

	                                   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception{ 

	        System.out.println("Before Handshake");

	        if (request instanceof ServletServerHttpRequest) {

	            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;

	            HttpSession session = servletRequest.getServletRequest().getSession(false);

	            if (session != null) {

	                //使用userName区分WebSocketHandler，以便定向发送消息

	                String userName = (String) session.getAttribute("userName");

	                if (userName==null) {

	                    userName="default-system";

	                }

	                attributes.put("userName",userName);

	            }else{

	                System.out.println("beforeHandshake 沒有取得 session");

	            }

	        }

	        return super.beforeHandshake(request, response, wsHandler, attributes);

	    }

	    @Override

	    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,

	                               WebSocketHandler wsHandler, Exception ex) {

	        System.out.println("After Handshake");

	        super.afterHandshake(request, response, wsHandler, ex);
	    }
	}
