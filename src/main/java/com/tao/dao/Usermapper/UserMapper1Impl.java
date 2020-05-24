package com.tao.dao.Usermapper;

import com.tao.dao.Usermapper.UserMapper1;
import com.tao.domain.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserMapper1Impl implements UserMapper1 {

    public void setSession(SqlSessionTemplate session) {
        this.session = session;
    }

    @Autowired
    private SqlSessionTemplate session;

    public User findById(Integer id) {
        return session.getMapper(UserMapper1.class).findById(id);
    }
}
