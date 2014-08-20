package com.ibusiness.dashboard.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibusiness.security.util.SpringSecurityUtils;

@Controller
@RequestMapping("dashboard")
public class DashboardController {

    @RequestMapping("dashboard")
    public String list(Model model) {
        String userId = SpringSecurityUtils.getCurrentUserId();

        return "dashboard/dashboard";
    }

    // ~ ==================================================
}
