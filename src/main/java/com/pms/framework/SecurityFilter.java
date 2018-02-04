package com.pms.framework;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;

/**
 *
 * @author Asu
 */
public class SecurityFilter implements Filter {

    ApplicationContext ac;

    public SecurityFilter(ApplicationContext ac) {
        this.ac = ac;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        if (uri.equals("/login.htm") || uri.equals("/invalidSession.htm") || uri.startsWith("/images/") || uri.startsWith("/css/") || uri.startsWith("/eprocws/")) {
            if (uri.equals("/login.htm") &&  req.getSession().getAttribute("__user__") != null) {
                res.sendRedirect("/home.htm");
            }
        } else {
            if (req.getSession().getAttribute("__user__") == null) {
                res.sendRedirect("/login.htm");
                return;
            }
        }
        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {

    }

}
