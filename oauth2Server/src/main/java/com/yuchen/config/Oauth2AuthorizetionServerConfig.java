package com.yuchen.config;/*
    @author yuchen
    @create -- 
*/

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;

import javax.sql.DataSource;

@Configuration
@EnableAuthorizationServer
@AllArgsConstructor
public class Oauth2AuthorizetionServerConfig extends AuthorizationServerConfigurerAdapter {
    //存放数据库信息
    private DataSource dataSource;
    //身份验证管理器
    private AuthenticationManager authenticationManager;

    private UserDetailService userDetailService;
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {
        security.allowFormAuthenticationForClients();
    }

    //客户端配置信息
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.withClientDetails(new JdbcClientDetailsService(dataSource));
    }

    //配置授权服务端点
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        //配置身份验证管理器 否则无法开启oauth2的用户名密码模式
        endpoints.authenticationManager(authenticationManager)
                //配置用户角色验证
                .userDetailsService(userDetailService);
    }

}
