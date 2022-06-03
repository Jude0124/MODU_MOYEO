package com.Modoomoyeo.momo.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
  
    @GetMapping("/login") //로그인
    public String login() {
        return "user/login";
    }

    @GetMapping("/register") //회원가입
    public String register() {
        return "user/register";
    }
  
    @GetMapping("/findId")
    public ModelAndView findId(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("user/find_id");
        return mav;
    }
    @PostMapping("/findId/{param}")
    public ModelAndView findIdByParam(@PathVariable String param){
        ModelAndView mav = new ModelAndView();
        /* param에 따라 구분하여 id 찾는 로직 구현 필요 */
        mav.setViewName("user/find_id_result");
        return mav;
    }
    @GetMapping("/findPw")
    public ModelAndView findPw(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("user/find_pw");
        return mav;
    }
    @GetMapping("/findPw/byEmail")
    public ModelAndView findPwDetails(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("user/find_pw_email");
        return mav;
    }
    @PostMapping("/findPw/reset")
    public ModelAndView resetPw(){
        ModelAndView mav = new ModelAndView();

        mav.setViewName("user/find_pw_reset");
        return mav;
    }
    @PostMapping("/changePw")
    public String changePw(){
        return "redirect:/";
    }
    @GetMapping("/personalInfo")
    public String goPersonalInfo(){
        return "user/personal_info";
    }
}

