package com.Modoomoyeo.momo.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class AdminController {
//    private final AdminService adminService;
    @GetMapping("/admin")
    public ModelAndView admin() {
        ModelAndView mav = new ModelAndView();

        //mav.addObject("list", adser.adminUsers());
        mav.setViewName("admin/admin");
        return mav;
    }
}


