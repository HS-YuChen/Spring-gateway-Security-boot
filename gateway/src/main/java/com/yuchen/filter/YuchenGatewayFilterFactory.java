package com.yuchen.filter;/*
    @author yuchen
    @create -- 
*/

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.bouncycastle.util.Arrays;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.List;

@Component
public class YuchenGatewayFilterFactory extends AbstractGatewayFilterFactory<YuchenGatewayFilterFactory.Config> {

    YuchenGatewayFilterFactory(){
        super(Config.class);
    }

    @Override
    public List<String> shortcutFieldOrder() {
        ArrayList<String> list = new ArrayList<>();
        list.add("name");
        list.add("age");
        return list;
    }

    @Override
    public GatewayFilter apply(Config config) {
        return new GatewayFilter() {
            @Override
            public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
                System.out.println(config.getAge()+config.getName());
                return chain.filter(exchange);
            }
        };
    }
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Config{
        private String name;
        private String age;
    }
}
