package userMapperTest;

import com.tao.dao.Usermapper.UserMapper1;
import com.tao.dao.Usermapper.UserMapper1Impl;
import com.tao.dao.Usermapper.Usermapper;
import com.tao.domain.User;
import com.tao.service.userService.UserSservice;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.Set;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Tests {

    @Autowired
    Usermapper usermapper;

    @Autowired
    UserSservice userSservice;

    @Autowired
    //@Qualifier("userMapper2")
    UserMapper1 userMapper1;

    @Autowired
    UserMapper1Impl userMapper2;

    @Autowired
    JedisConnectionFactory jedisConnectionFactory;

    @Test
    public void Jedis(){
        System.out.println(jedisConnectionFactory);
        Jedis jedis = (Jedis) jedisConnectionFactory.getConnection().getNativeConnection();
        jedis.set("username","zhangsan");
        List<String> mylist = jedis.lrange("mylist", 0, -1);
        if(mylist!=null){
            for(String list:mylist){
                System.out.println(list);
            }
        }
        Set<String> keys = jedis.keys("*");
        for (String key:keys){
            System.out.println(key);
        }
    }

    @Test
    public void findAll(){
        //List<User> users = usermapper.findAll();
        List<User> users = userSservice.findAll();
        for(User user:users){
            System.out.println(user);
        }
    }

    @Test
    public void findById(){
        //User user = usermapper.findById(3);
        //User user = userMapper1.findById(3);
        User user = userMapper2.findById(3);
        System.out.println(user);

    }

    @Test
    public void updateByid(){
        User user = new User();
        user.setId(1);
        user.setAddress("湖北省武汉市");
        Integer id = userSservice.updateById(user);
        System.out.println(id);
    }
    @Test
    public void insertUser(){
        User user = new User();
        user.setUsername("王五");
        user.setSex("男");
        user.setEmail("51234124@qq.com");
        user.setPassword("123456");
        user.setAddress("湖北省武汉市");
        Integer id = userSservice.insertUser(user);
        System.out.println(id+"--id："+user.getId());
    }

    @Test
    public void findByName(){
        Integer i = userSservice.findByName("qw");
        System.out.println(i);
    }
}
