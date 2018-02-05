package com.sitec.cpse.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Asu
 */
@Controller
public class LoginController {

    

    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String onGetLoginPage(Model m) {
        m.addAttribute("user", this);
        return "common/login";
    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String onPostLogin(Model m, @RequestParam String username, @RequestParam String password, HttpSession session, HttpServletRequest request) {
        session.setAttribute("_user_cpse_", this);
        return "redirect:/home.htm";
    }

    @RequestMapping(value = "/logoff.htm", method = RequestMethod.GET)
    public String onLogoff(HttpSession session) {
        session.invalidate();
        return "redirect:/login.htm";
    }
}
