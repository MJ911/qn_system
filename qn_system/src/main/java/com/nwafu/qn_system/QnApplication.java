package com.nwafu.qn_system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;


//(scanBasePackages ="com.example.Controller") 扫描的包
//如果SpringBootApplication后面不加则默认扫描子包
//DB MySQL
//DAO : MyBatis
//Service:体现业务逻辑，事务的边界
//View：SpringMVC
//下一层直接调用上一层 不要跨层调用
@EnableTransactionManagement
@SpringBootApplication
@MapperScan(basePackages="com.nwafu.qn_system.dao")
public class QnApplication {
	
	

	public static void main(String[] args) {
		SpringApplication.run(QnApplication.class, args);
	}

}
