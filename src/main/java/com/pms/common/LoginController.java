package com.pms.common;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Asu
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/invalidSession.htm", method = RequestMethod.GET)
    public String invalidSession() {
        return "common/invalidSession";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
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

    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String getLoginPage(Model m) {
        m.addAttribute("user", this);
        return "common/login";
    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String submitLoginPage(HttpServletRequest req) {
        return "redirect:/home.htm";
    }

    @RequestMapping(value = "/home.htm", method = RequestMethod.GET)
    public String homePage(Model m) {
        return "common/home";
    }

    @RequestMapping(value = "/logout.htm")
    public String logout(HttpSession session) {
        return "redirect:/lofin.htm";
    }
}
