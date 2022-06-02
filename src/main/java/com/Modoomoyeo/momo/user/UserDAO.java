package com.Modoomoyeo.momo.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserDAO extends JpaRepository<UserVO, String> {
    UserVO findByIdAndPassword(String Id, String password);
}
