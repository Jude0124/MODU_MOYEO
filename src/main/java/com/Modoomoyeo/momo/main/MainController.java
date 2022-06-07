package com.Modoomoyeo.momo.main;

import com.Modoomoyeo.momo.session.SessionConst;
import com.Modoomoyeo.momo.user.UserServiceImpl;
import com.Modoomoyeo.momo.user.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final UserServiceImpl userServiceImpl;
    @GetMapping("/")
    public ModelAndView main(@SessionAttribute(name = SessionConst.LOGIN_USER, required = false) UserVO loginUser) {

        ModelAndView mav = new ModelAndView();
        mav.setViewName("main/main");
        if(loginUser != null){
            UserVO userInfo = userServiceImpl.getUser(loginUser);
            mav.addObject("userInfo", userInfo);
        }
        return mav;
    }
}
