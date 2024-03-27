package org.example.backend.config;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.backend.entity.Result;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;


import java.io.IOException;
import java.io.PrintWriter;

@Configuration
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http.authorizeHttpRequests((requests) -> requests
                .requestMatchers("/api/book/**").permitAll()
                .anyRequest().authenticated()
                ).formLogin(
                        conf -> {
                            conf.loginProcessingUrl("/api/user/login");
                            conf.successHandler(this::handleProcess);
                            conf.failureHandler(this::handleProcess);
                            conf.permitAll();
                        }
                ).csrf(AbstractHttpConfigurer::disable)
                .cors(
                        conf -> {
                            CorsConfiguration cors = new CorsConfiguration();
                            cors.addAllowedOrigin("http://localhost:5173");
                            cors.setAllowCredentials(true);//允许携带cookie
                            cors.addAllowedMethod("*");
                            cors.addAllowedHeader("*");
                            cors.addExposedHeader("*");//暴露header
                            UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();//配置源
                            source.registerCorsConfiguration("/**", cors);//对所有接口生效
                            conf.configurationSource(source);
                        }
                ).exceptionHandling(
                        conf->{
                            conf.accessDeniedHandler(this::handleProcess);
                            conf.authenticationEntryPoint(this::handleProcess);
                        }
                ).logout(
                        conf->{
                            conf.logoutUrl("/api/user/logout");
                            conf.logoutSuccessHandler(this::handleProcess);
                        }
                ).build();
    }

    private void handleProcess(
            HttpServletRequest request,
            HttpServletResponse response,
            Object exceptionOrAuthentication) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        PrintWriter writer = response.getWriter();
        if (exceptionOrAuthentication instanceof AccessDeniedException exception) {
            writer.write(Result.error(403, exception.getMessage()).asJsonString());//权限不足
        } else if (exceptionOrAuthentication instanceof Exception exception) {
            writer.write(Result.error(401, exception.getMessage()).asJsonString());//未登录
        } else if (exceptionOrAuthentication instanceof Authentication authentication) {
            writer.write(Result.success(authentication).asJsonString());
        }
    }


}

