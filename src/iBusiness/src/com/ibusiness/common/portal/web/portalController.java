package com.ibusiness.common.portal.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibusiness.security.util.SpringSecurityUtils;

@Controller
@RequestMapping("portal")
public class portalController {

    @RequestMapping("portal")
    public String list(Model model) {
        String userId = SpringSecurityUtils.getCurrentUserId();

        return "portal/portal";
    }

    // ~ ==================================================
}
