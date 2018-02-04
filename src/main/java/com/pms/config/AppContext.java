package com.pms.config;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

/**
 *
 * @author Asu
 */
@Component
public class AppContext implements ApplicationContextAware, ResourceLoaderAware {

    private static final Logger logger = Logger.getLogger(AppContext.class.getName());
    private static ApplicationContext context;
    private static ResourceLoader resourceLoader;
    private static String imagePath;

    @Override
    public void setApplicationContext(ApplicationContext ac) throws BeansException {
        context = ac;
    }

    @Override
    public void setResourceLoader(ResourceLoader resourceLoader) {
        AppContext.resourceLoader = resourceLoader;
    }

    public static ApplicationContext getApplicationContext() {
        return context;
    }

    public static Resource getResources(String location) {
        return resourceLoader.getResource(location);
    }

    public static String getImagePath() {
        return imagePath;
    }

    public static void setImagePath(String aImagePath) {
        logger.debug("setting up image path=" + aImagePath);
        imagePath = aImagePath;
    }

    }
