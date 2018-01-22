package com.dactech.requestoff.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;

@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private AccessDeniedHandler accessDeniedHandler;
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.csrf()
			.disable()
		.authorizeRequests()
			.antMatchers("/")
				.permitAll()
			.antMatchers("/admin/**", "/index")
				.hasAnyRole("ADMIN")
			.antMatchers("/user/**")
				.hasAnyRole("USER")
			.antMatchers("/role1/**")
				.hasAnyRole("role1")
			.anyRequest()
				.permitAll()
			.and()
		.formLogin()
			.loginPage("/login")
			.permitAll()
			.and()
		.logout()
			.permitAll()
			.and()
		.exceptionHandling()
			.accessDeniedHandler(accessDeniedHandler);
	}

	// create two users, admin and user
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.inMemoryAuthentication()
				.withUser("user")
					.password("$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki")
					.roles("USER")
					.and()
				.withUser("admin")
					.password("$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki")
					.roles("ADMIN")
					.and()
				.withUser("role")
					.password("$2a$10$B0xSgQS8Bf/nmXD.0BcBd.gU5cY/8gjNbJ/uCetP3mw6.nTC/O5Ki")
					.roles("role1")
					.and()
				.passwordEncoder(bCryptPasswordEncoder)
				.and()
			.jdbcAuthentication()
				.usersByUsernameQuery("SELECT email, password, valid_flag FROM employee where email = ?")
				.authoritiesByUsernameQuery("SELECT email, role FROM employee INNER JOIN employee_role "
					+ "ON employee.id = employee_role.employee_id "
					+ "INNER JOIN role ON employee_role.role_id = role.id "
					+ "WHERE email = ?")
				.dataSource(dataSource)
				.passwordEncoder(bCryptPasswordEncoder);
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web
			.ignoring()
			.antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**");
	}
	
}
