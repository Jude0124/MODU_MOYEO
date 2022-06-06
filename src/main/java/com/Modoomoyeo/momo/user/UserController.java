package com.Modoomoyeo.momo.user;

import com.Modoomoyeo.momo.session.SessionConst;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

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
        if (bindingResult.hasErrors())  {
            System.out.println(bindingResult.hasErrors());
            bindingResult.addError(new FieldError("loginError","loginError","아이디 또는 비밀번호를 입력해주세요."));
            return "user/login";
        }
        UserVO loginUser = userServiceImpl.checkLoginUser(loginDTO);
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
    public String userRegister(@Validated UserVO userVO, BindingResult bindingResult){
        System.out.println(userVO);
        if (bindingResult.hasErrors()){
            return "user/register";
        }
        userServiceImpl.joinUser(userVO);
        return "redirect:/";
    }

    @PostMapping("/register/idDuplicateCheck")
    @ResponseBody
    public String idDuplicateCheck(@RequestBody String id){
        String result = userServiceImpl.idDuplicateCheck(id);
        return result;
    }

    @PostMapping("/register/nicknameDuplicateCheck")
    @ResponseBody
    public String nicknameDuplicateCheck(@RequestBody String nickname){
        String result = userServiceImpl.nicknameDuplicateCheck(nickname);
        return result;
    }

    @PostMapping("/register/emailDuplicateCheck")
    @ResponseBody
    public String emailDuplicateCheck(@RequestBody String email){
        String result = userServiceImpl.emailDuplicateCheck(email);
        return result;
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
    public String goPersonalInfo(@SessionAttribute(name = SessionConst.LOGIN_USER, required = false) UserVO loginUser ,Model model){
        UserVO userInfo = userServiceImpl.getUser(loginUser);
        model.addAttribute("userInfo", userInfo);
        System.out.println(userInfo.getId());

        return "user/personal_info";
    }
    @PostMapping("/personalInfo")
    public String editPersonalInfo(@Validated UserVO userVO, BindingResult bindingResult, ModelAndView mav){
        if (bindingResult.hasErrors()){
            return "user/personal_info";
        }
        userServiceImpl.updateUser(userVO);
        mav.setViewName("user/personal_info");
        return "redirect:/personalInfo";
    }
}

