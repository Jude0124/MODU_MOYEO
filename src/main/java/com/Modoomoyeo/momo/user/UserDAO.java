package com.Modoomoyeo.momo.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserDAO extends JpaRepository<UserVO, String> {
    UserVO findByIdAndPassword(String id, String password);

    @Query(value = "SELECT a FROM UserVO a WHERE a.id = :id")
    UserVO findByUserId(@Param("id") String id);

    UserVO findByEmail(String email);

}
