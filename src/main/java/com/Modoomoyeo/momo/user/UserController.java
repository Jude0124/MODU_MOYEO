package com.Modoomoyeo.momo.user;

import com.Modoomoyeo.momo.session.SessionConst;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserServiceImpl userServiceImpl;

    @GetMapping("/login") //로그인 페이지 이동
    public String loginMapping() {
        return "user/login";
    }

    @PostMapping("/login")
    public String userLogin(@Validated LoginDTO loginDTO, BindingResult bindingResult,
                            HttpServletRequest request){
        System.out.println(loginDTO);
        if (bindingResult.hasErrors())  {
            System.out.println(bindingResult.hasErrors());
            bindingResult.addError(new FieldError("loginError","loginError","아이디 또는 비밀번호를 입력해주세요."));
            return "user/login";
        }
        UserVO loginUser = userServiceImpl.checkLoginUser(loginDTO);
        System.out.println("서비스 통과 후 loginUser: "+loginUser);
        if(loginUser == null){
            bindingResult.addError(new FieldError("loginFail","loginFail","아이디 또는 비밀번호를 다시 확인해주세요."));
            return "user/login";
        }

        HttpSession session = request.getSession();

        session.setAttribute(SessionConst.LOGIN_USER, loginUser);
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logoutMapping(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/register") //회원가입 페이지 이동
    public String registerMapping() {
        return "user/register";
    }

    @PostMapping("/register")   // 회원가입
    public String userRegister(UserVO userVO){
        System.out.println(userVO);
        userServiceImpl.joinUser(userVO);
        return "redirect:/";
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

