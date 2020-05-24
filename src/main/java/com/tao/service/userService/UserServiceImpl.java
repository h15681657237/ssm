package com.tao.service.userService;

import com.tao.dao.Usermapper.Usermapper;
import com.tao.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserSservice {

    @Autowired
    private Usermapper userdao;

    public List<User> findAll() {

        return userdao.findAll();
    }


    public User findById(Integer id) {

        return userdao.findById(id);
    }

    @Override
    public Integer deleteById(int id) {

        return userdao.deleteById(id);
    }

    @Override
    public Integer updateById(User user) {

        return userdao.updateById(user);
    }

    @Override
    public Integer insertUser(User user) {
        return userdao.insertUser(user);
    }

    @Override
    public Integer findByName(String username) {
        return userdao.findByName(username);
    }

    @Override
    public User login(String username) {
        return userdao.login(username);
    }
}
