package com.yuchen.config;/*
    @author yuchen
    @create --
*/

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.authorization.ServerAccessDeniedHandler;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Arrays;
import java.util.List;

@Configuration
@EnableWebFluxSecurity
@Slf4j
@RequiredArgsConstructor
public class SecurityConfig {
    //授权管理验证
    private final AuthorizationManager authorizationManager;
    //授权失败
    private final AuthorizationFailure authorizationFailure;
    //认证失败
    private final AuthenticationFailure authenticationFailure;

    @Value("${whitelist}")
    private String whiteList;

    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http){
        log.info("经过security过滤器链了");
        //授权验证
        http.authorizeExchange()
                //配置白名单
                .pathMatchers(whiteList).permitAll()
                //其他请求都要进行权限验证
                .anyExchange().access(authorizationManager)
                //鉴权失败
                .and().exceptionHandling()
                .accessDeniedHandler(authorizationFailure)
                .authenticationEntryPoint(authenticationFailure);

        return http.build();
    }

}
