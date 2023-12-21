package com.fresh.common.config;

import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.RequestHandler;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class Swagger2 {

    //    http://localhost:8080/swagger-ui.html     原路径

    // 配置swagger2核心配置 docket
    @Bean
    public Docket createRestApi() {
        Predicate<RequestHandler> userPredicate = RequestHandlerSelectors.basePackage("com.yc.user.controller");
        // 指定api类型为swagger2
        return new Docket(DocumentationType.SWAGGER_2)
                // 用于定义api文档汇总信息
                .apiInfo(apiInfo())
                .select()
                .apis(Predicates.or(userPredicate))
                // 所有controller
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("api")                       // 文档页标题
                .contact(new Contact("yc",
                        "https://www.hyycinfo.com",
                        "xxxxxxxxxxx"))                   // 联系人信息
                .description("Fresh平台的api文档")      // 详细信息
                .version("1.0.1")                               // 文档版本号
                .termsOfServiceUrl("https://www.github.com//yikoutian1")     // 网站地址
                .build();
    }
}