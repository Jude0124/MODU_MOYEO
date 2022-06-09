package com.Modoomoyeo.momo.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService {
    private final UserDAO userDAO;

    @Transactional
    public void joinUser(UserVO userVO) {
        userDAO.save(userVO);
    }

    @Transactional
    public UserVO checkLoginUser(LoginDTO loginDTO) {
        UserVO checkUser = userDAO.findByIdAndPassword(loginDTO.getId(), loginDTO.getPassword());
        if (checkUser==null){
            return null;
        }
        return checkUser;
    }



    public String idDuplicateCheck(String id) {
        if (userDAO.findByUserId(id)!=null){
            return "true";
        }
        return "false";
    }

    public String nicknameDuplicateCheck(String nickname) {
        if (userDAO.findByNickname(nickname)!=null){
            return "true";
        }
        return "false";
    }

    public String emailDuplicateCheck(String email) {
        if (userDAO.findByEmail(email)!=null){
            return "true";}
        return "false";
    }

    public UserVO getUserByEmail(String email){return userDAO.findByEmail(email);}



    public String findIdByEmail(String email) {
        String message;
        if (userDAO.findByEmail(email) != null) {
            message = "해당 이메일로 가입하신 아이디는 [ " + userDAO.findByEmail(email).getId() + " ] 입니다. ";
        } else {
            message = "해당 이메일로 등록된 아이디가 존재하지않습니다.";
        }
        return message;
    }

    public UserVO getUser(UserVO loginUser) {
        return userDAO.findByUserId(loginUser.getId());
    }
    @Transactional
    public void updateUser(UserVO userVO) {
        if (userDAO.findByUserId(userVO.getId()) != null)
            userDAO.save(userVO);
    }

    public void deleteUser(String userId) {
        userDAO.delete(userDAO.findByUserId(userId));

    }

    public void changePW(String email, String pw) {
        UserVO userInfo = userDAO.findByEmail(email);
        if (userInfo == null){
            return;
        }
        userInfo.setPassword(pw);
        this.updateUser(userInfo);
    }
}
