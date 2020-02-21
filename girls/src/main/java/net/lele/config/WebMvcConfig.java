/*
 * package net.lele.config;
 * 
 * import org.springframework.context.annotation.Configuration; import
 * org.springframework.transaction.annotation.EnableTransactionManagement;
 * import
 * org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
 * import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
 * 
 * @Configuration
 * 
 * @EnableTransactionManagement public class WebMvcConfig implements
 * WebMvcConfigurer {
 * 
 * @Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
 * registry .addResourceHandler("/images/**")
 * .addResourceLocations("classpath:/static/images/");
 * 
 * registry .addResourceHandler("/**")
 * .addResourceLocations("classpath:/static/");
 * 
 * } }
 */