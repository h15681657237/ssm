package com.tao.service.userService;

import com.tao.domain.User;

import java.util.List;

public interface UserSservice {

    public List<User> findAll();


    public User findById(Integer id);

    public Integer deleteById(int id);

    public Integer updateById(User user);

    public Integer insertUser(User user);

    public Integer findByName(String username);

    public User login(String username);
}
