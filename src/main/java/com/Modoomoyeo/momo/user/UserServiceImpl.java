package com.Modoomoyeo.momo.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService {
    private final UserDAO userDAO;

    public void joinUser(UserVO userVO) {
        userDAO.save(userVO);
    }

    public UserVO checkLoginUser(LoginDTO loginDTO) {
        System.out.println(loginDTO);
            return userDAO.findById(loginDTO.getId())
                    .filter(m -> m.getPassword().equals(loginDTO.getPassword()))
                    .orElse(null);
    }
}
