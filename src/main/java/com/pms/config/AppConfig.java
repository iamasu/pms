package com.pms.config;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 *
 * @author Asu
 */
@Configuration
@ComponentScan(basePackages = "com.pms")
@Import({WebMvcConfig.class})
@EnableScheduling
@PropertySource(value = {"classpath:email.properties"})
public class AppConfig {

    private static final Logger LOGGER = Logger.getLogger(AppConfig.class.getName());

    @Autowired
    private Environment env;

    @Bean
    public static PropertySourcesPlaceholderConfigurer propertyPlaceHolderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }

}
