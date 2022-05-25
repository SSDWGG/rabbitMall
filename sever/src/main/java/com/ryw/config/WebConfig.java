package com.ryw.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {
    /*
    *   1 设置访问任何请求都允许跨域
    *   2 设置允许跨域的访问来源地址
    *   3 设置访问的方法
        4 最大响应时间
    *   5 是否允许携带参数
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins(
                        "http://localhost:8080",   //本地端口跨域
                        "http://119.3.145.125",   //公网ip访问
                        "http://ssdwgg.xyz",   //域名1
                        "http://www.ssdwgg.xyz",   //域名2
                        "null")
                .allowedMethods("POST", "GET", "PUT", "OPTIONS", "DELETE")
                .maxAge(3600)
                .allowCredentials(true);
    }


}



