package net.lele.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import net.lele.service.MyAuthenticationProvider;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	MyAuthenticationProvider myAuthenticationProvider;

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/res/**");
		/* web.ignoring().antMatchers("/static/images/**"); */
	}
	// /res/** 패턴의 URL은 보안검사를 하지 말고 무시하라는 설정 (리소스파일들)

	@Override
    protected void configure(HttpSecurity http) throws Exception
    {
        http.authorizeRequests() //권한 설정 시작    /   앞>>>>뒤 - 우선순위
			.antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")   /* .access("ROLE_ADMIN") */
            //admin/** 패턴은 ROLE_ADMIN권한소유자만 요청가능 아니면 거부당함
            .antMatchers("/guest/**").permitAll()
            // 로그인하지 않은 사용자도 허용
            .antMatchers("/").permitAll()
            // 모든 사용자 ㅇㅅㅇ
        	.antMatchers("/", "/images/**", "/resources/**", "/resources/images/**")    
        	.permitAll()
            .antMatchers("/**").authenticated();
        // /** 패턴은 로그인된 사용자에게만 허용

        http.csrf().disable();
        //CSRF 공격 검사하지않겠당 ~_~

        http.formLogin() //로그인 페이지 설정 시작
            .loginPage("/guest/login") //로그인 페이지 URL 설정
            .loginProcessingUrl("/guest/login_processing")
            // 로그인 페이지에서 '로그인' 버튼이 눌럿을때 요청할 URL 설정
            .failureUrl("/guest/login?error")
            // 로그인이 실패했을 때 redirect URL 설정
            .defaultSuccessUrl("/user/index", true)
            // 로그인이 성공했을 때 redirect URL 설정
            .usernameParameter("loginId")
            .passwordParameter("passwd");
        	// 로그인 페이지(view)에서 로그인 id input태그의 name값과 비밀번호 input태그의 name값 설정

        http.logout() //로그아웃 설정 시작
            .logoutRequestMatcher(new AntPathRequestMatcher("/user/logout_processing"))
            // 로그아웃 버튼이나 링크를 눌렀을 때 요청할 URL 설정
            .logoutSuccessUrl("/guest/index")
            //로그아웃된 후  redirect URL 설정
            .invalidateHttpSession(true);
        	// 로그아웃할 때 session에 들어있는 데이터를 전부 지우라는 설정

        http.authenticationProvider(myAuthenticationProvider);
    }
}
