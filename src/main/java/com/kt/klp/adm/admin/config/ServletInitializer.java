package com.kt.klp.adm.admin.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;

/**
*
* ServletInitializer :
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.12       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.12
* @version 1.0.0
* @see
*
*/

@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class,DataSourceTransactionManagerAutoConfiguration.class })
@PropertySource("classpath:application.yml")
@ComponentScan("kr.co.iousoft;com.kt")
public class ServletInitializer extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(ServletInitializer.class, args);
	}

	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ServletInitializer.class);
	}
	
}
