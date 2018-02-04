package com.pms.common;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ThemeResolver;

/**
 *
 * @author Asu
 */
@Controller
public class SettingsController {

    @Autowired
    private ThemeResolver themeResolver;

    @RequestMapping(value = "/setting/theme.htm", method = RequestMethod.GET)
    @ResponseBody
    public String themes(@RequestParam String theme, HttpServletRequest request) {
        return themeResolver.resolveThemeName(request);
    }

    @RequestMapping(value = "/setting/bgimg.htm", method = RequestMethod.GET)
    public String bgImg() {
        return "layout/bgimg";
    }

    @RequestMapping(value = "/settings/{tab}", method = RequestMethod.GET)
    public String settings(Model m, @PathVariable String tab) {
        m.addAttribute("tab", tab);
        return "layout/settings";
    }

    @RequestMapping(value = "/settings/{tab}", method = RequestMethod.POST)
    public String settings(@PathVariable String tab) {
        return "redirect:/home.htm";
    }

}
