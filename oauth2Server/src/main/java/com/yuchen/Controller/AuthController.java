package com.yuchen.Controller;/*
    @author yuchen
    @create -- 
*/

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;

@RequestMapping("/oauth")
@RestController
public class AuthController {

    @RequestMapping("/admin")
    public String token(){
        String result = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority:authorities){
            result += grantedAuthority.getAuthority();
        }
        return result;
    }

    @RequestMapping("/yuchen")
    public String yuchen(){
        String result = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority:authorities){
            result += grantedAuthority.getAuthority();
        }
        return result;
    }
}
