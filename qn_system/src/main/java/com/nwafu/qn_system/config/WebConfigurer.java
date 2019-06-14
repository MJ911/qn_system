package com.nwafu.qn_system.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.nwafu.qn_system.config.intercepors.LoginInterceptor;

@Configuration
public class WebConfigurer implements WebMvcConfigurer {

  @Autowired
  private LoginInterceptor loginInterceptor;
  // 这个方法是用来配置静态资源的，比如html，js，css，等等
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
  }

  // 这个方法用来注册拦截器，我们自己写好的拦截器需要通过这里添加注册才能生效
  @Override
  public void addInterceptors(InterceptorRegistry registry) {
//	 addPathPatterns("/**");
//      excludePathPatterns("/login", "/register");
      registry.addInterceptor(loginInterceptor).addPathPatterns("/**").excludePathPatterns("/qn_system/login", "/qn_system/index", "/qn_system/questionnaire_list/0","/qn_system/questionnaire_list/1","/qn_system/src/main/webapp/css","/qn_system/src/main/webapp/images","/qn_system/src/main/webapp/js","/qn_system/src/main/webapp/loginSpecial");
  }
}
