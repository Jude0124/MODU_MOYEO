package com.Modoomoyeo.momo.user;

import lombok.RequiredArgsConstructor;
import org.apache.catalina.core.StandardPipeline;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

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

    public String emailDuplicateCheck(String email) {
        if (userDAO.findByEmail(email)!=null){
            return "true";
        }
        return "false";
    }
}
