package com.tao.dao.Usermapper;

import com.tao.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


@Repository
public interface UserMapper1 {
    @Select("select * from users where id=#{id}")
    public User findById(Integer id);
}
