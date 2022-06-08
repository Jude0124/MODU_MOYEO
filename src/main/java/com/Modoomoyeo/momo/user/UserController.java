package com.Modoomoyeo.momo.user;

import com.Modoomoyeo.momo.session.SessionConst;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

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
    public ModelAndView findPwDetails(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ModelAndView mav = new ModelAndView();
        String email= request.getParameter("email");

        UserVO vo = userServiceImpl.getUserByEmail(email);

        if(vo != null) {
            Random r = new Random();
            int num = r.nextInt(999999); //랜덤난수설정

            session.setAttribute("email", vo.getEmail());

            String setfrom = "legagain@gmail.com"; // 관리자
            String tomail = email; // 받는사람
            String title = "[모두모여] 비밀번호변경 인증 이메일입니다.";
            String content = System.getProperty("line.seperator") + "안녕하세요 회원님" + System.getProperty("line.separator")
                    + "모두모여  비밀번호찾기(변경) 인증번호는" + num + "입니다." + System.getProperty("line.sepertaor");//

            try {
                MimeMessage message = mailSender.createMimeMessage();
            }

            }
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

