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

    public void joinUser(UserVO userVO) {
        userDAO.save(userVO);
    }

    @Transactional
    public UserVO checkLoginUser(LoginDTO loginDTO) {
        System.out.println("userService도착: "+loginDTO);
        System.out.println("dao에서 id로 찾기: "+userDAO.findById(loginDTO.getId()));
        UserVO checkUser = userDAO.findByIdAndPassword(loginDTO.getId(), loginDTO.getPassword());
        if (checkUser==null){
            return null;
        }
        return checkUser;
    }

    public UserVO findID(String email){
        UserVO userInfo = userDAO.findByEmail(email);

        if (userInfo == null){
            return null;
        }
        return userInfo;
    }


}
