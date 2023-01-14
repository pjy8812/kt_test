package com.kt.klp.adm.admin.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
*
* SecurityConfiguration :
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

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/assets/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
			.antMatchers("/", "/error").permitAll()
			.anyRequest().permitAll()
			.and().formLogin() //로그인에 대한 설정
				.loginPage("/") //로그인 페이지
				.permitAll()
			.and().logout()
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true)
			.and().sessionManagement()
				.invalidSessionUrl("/invalid/session")
				.maximumSessions(1)
				.maxSessionsPreventsLogin(false)
				.expiredUrl("/expire.login");
		
	}
}

