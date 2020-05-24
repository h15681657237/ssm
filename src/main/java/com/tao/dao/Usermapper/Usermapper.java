package com.tao.dao.Usermapper;

import com.tao.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface Usermapper {

    @Select("select * from users")
    public List<User> findAll();

    //@Select("select * from users where id=#{id}")
    public User findById(Integer id);

    @Select("delete from users where id=#{id}")
    public Integer deleteById(int id);

    public Integer updateById(User user);

    public Integer insertUser(User user);

    @Select("select * from users where username=#{username}")
    public Integer findByName(String username);

    @Select("select * from users where username=#{username}")
    public User login(String username);
}
