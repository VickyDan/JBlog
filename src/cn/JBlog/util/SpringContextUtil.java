package cn.JBlog.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
 
//鍗忓姪闈瀋ontroller鐨勬櫘閫氱被鑾峰緱bean
public class SpringContextUtil implements ApplicationContextAware {
 
    private static ApplicationContext applicationContext; // Spring搴旂敤涓婁笅鏂囩幆澧�? 
    // 涓嬮潰鐨勮繖涓柟娉曚笂鍔犱簡@Override娉ㄨВ锛屽師鍥犳槸缁ф壙ApplicationContextAware鎺ュ彛鏄繀椤诲疄鐜扮殑鏂规�?
    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        SpringContextUtil.applicationContext = applicationContext;
    }
 
    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }
 
    public static Object getBean(String name) throws BeansException {
        return applicationContext.getBean(name);
    }
 
    @SuppressWarnings("unchecked")
	public static Object getBean(String name, Class requiredType)
            throws BeansException {
        return applicationContext.getBean(name, requiredType);
    }
 
    public static boolean containsBean(String name) {
        return applicationContext.containsBean(name);
    }
 
    public static boolean isSingleton(String name) throws NoSuchBeanDefinitionException {
        return applicationContext.isSingleton(name);
    }
 
    public static Class getType(String name)    throws NoSuchBeanDefinitionException {
        return applicationContext.getType(name);
    }
 
    public static String[] getAliases(String name) throws NoSuchBeanDefinitionException {
        return applicationContext.getAliases(name);
    }
}
