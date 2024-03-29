package com.ankit.springsecurity.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception{
        //Add users for in memory auth

        User.UserBuilder users = User.withDefaultPasswordEncoder();
        auth.inMemoryAuthentication()
                .withUser(users.username("John").password("abc").roles("EMPLOYEE"))
                .withUser(users.username("Mary").password("def").roles("EMPLOYEE","MANAGER"))
                .withUser(users.username("Matt").password("ghi").roles("EMPLOYEE","ADMIN"))
                .withUser(users.username("Tim").password("jkl").roles("EMPLOYEE"));
    }

    protected void configure(HttpSecurity http)  throws Exception{
        http.authorizeRequests()
                .antMatchers("/").hasRole("EMPLOYEE")
                .antMatchers("/leaders/**").hasRole("MANAGER")
                .antMatchers("/system/**").hasRole("ADMIN")
            .and()
            .formLogin()
                .loginPage("/showLoginPage")
                .loginProcessingUrl("/authenticateTheUser")
                .permitAll()
            .and()
                .logout().permitAll()
            .and()
                .exceptionHandling().accessDeniedPage("/access-denied");
    }
}
