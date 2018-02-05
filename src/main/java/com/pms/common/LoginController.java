package com.pms.common;

import java.security.Principal;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Asu
 */
@Controller
public class LoginController {


    @RequestMapping(value = "/sessionout.htm", method = RequestMethod.GET)
    public String sessionout() {
        return "home/sessionout";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String er403(Model m, Principal user, HttpServletResponse response) {
        if (user != null) {
            m.addAttribute("status", response.getStatus());
            m.addAttribute("msg", "Hi " + user.getName() + ", you do not have permission to access this page!");
        } else {
            m.addAttribute("status", response.getStatus());
            m.addAttribute("msg", "You do not have permission to access this page!");
        }
        return "errors/403";
    }

    @RequestMapping(value = "/u/aboutme", method = RequestMethod.GET)
    public String getAboutPage(Model m) {
        m.addAttribute("user", this);
        return "home/about";
    }

    @RequestMapping(value = "/u/hireme", method = RequestMethod.GET)
    public String onGetHireMe(Model m) {
        return "home/contact";
    }

    @RequestMapping(value = "/u/hireme", method = RequestMethod.POST)
    public String onPostSendMail() {
        return "redirect:/u/hireme";
    }

    @RequestMapping(value = "/u/projects", method = RequestMethod.GET)
    public String getProjectsPage(Model m) {
        m.addAttribute("user", this);
        return "home/projects";
    }

    @RequestMapping(value = "/u/myresume", method = RequestMethod.GET)
    public String getMyResumePage(Model m) {
        m.addAttribute("user", this);
        return "home/myresume";
    }

    @Transactional
    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String getLoginPage(@CookieValue(value = "hitCounter", defaultValue = "0") String hitCounter, Model m, HttpServletResponse response, HttpServletRequest request) {
        m.addAttribute("user", this);
        Cookie cookie = new Cookie("hitCounter", hitCounter);
        response.addCookie(cookie);
        return "home/login";
    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String submitLoginPage(HttpServletRequest req) {
        return "redirect:/home.htm";
    }

    @RequestMapping(value = "/logout.htm")
    public String logout(HttpSession session) {
        return "redirect:/login.htm";
    }
}
