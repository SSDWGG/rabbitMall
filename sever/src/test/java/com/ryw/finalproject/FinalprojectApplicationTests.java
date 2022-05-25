package com.ryw.finalproject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ryw.entity.*;
import com.ryw.mapper.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class FinalprojectApplicationTests {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserinfoMapper userinfoMapper;
    @Autowired
    private UserorderMapper userorderMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private GoodsimgMapper goodsimgMapper;
    @Autowired
    private SizerestcountMapper sizerestcountMapper;
    @Test
    void testuserinfo() {
//        Page<Userinfo> page = new Page<>(1, 100);
//        List<Userinfo> resources = userinfoMapper.userinfoPagelistAnduser(page);
//        page.setRecords(resources);
//        page.getRecords().forEach(System.out::println);
    }
    @Test
    public void countsub()
    {
        QueryWrapper wrapper = new QueryWrapper();
        Map<String, Object> params = new HashMap<>();
        params.put("goodsid",1);
        params.put("size",'s');
        wrapper.allEq(params,false);
        Sizerestcount sizerestcount = sizerestcountMapper.selectOne(wrapper);
        int count = sizerestcount.getRestcount();
        count--;
        sizerestcount.setRestcount(count);
        sizerestcountMapper.update(sizerestcount,wrapper);
    }
    @Test
    void testselectList() {
        //查询全部
//        List<Goods> goodsList = goodsMapper.selectList(null);
//        goodsList.forEach(System.out::println);
        List<Goods> goodsList = goodsMapper.getoutgoods();
        goodsList.forEach(System.out::println);
//        List<Goodsimg> goodsimgs = goodsimgMapper.selectList(null);
//        goodsimgs.forEach(System.out::println);
//
//        List<Sizerestcount> sizerestcounts = sizerestcountMapper.selectList(null);
//        sizerestcounts.forEach(System.out::println);
    }
    @Test
    void testInsert(){
        //测试插入
        User user = new User();
        user.setUsername("rywDtest1");
        user.setPassword("123435");
        user.setEmail("123@qq.com");
        int result = userMapper.insert(user);		//会自动生成id(自动生成唯一id)
        System.out.println(result);					//受影响的行数   sout
        System.out.println(user);
    }
    @Test
    public void testUpdatebyid(){			// 通过条件自动拼接动态sql
        User user = new User();
        user.setId(1451757224262139906L);
        user.setUsername("rywDtest1");
        user.setPassword("123435");
        int i = userMapper.updateById(user); // 注意:updateById 但是参数是一个 对象!
        System.out.println(i);
    }
    @Test//版本号会自动改变
    public void testOptimisticLocker(){
        // 1、查询用户信息
        User user = userMapper.selectById(1L);
        // 2、修改用户信息
        user.setUsername("rywDtest1");
        user.setEmail("24736743@qq.com");
        // 3、执行更新操作
        userMapper.updateById(user);
    }
    @Test// 测试乐观锁失败!多线程下
    public void testOptimisticLocker2(){
        // 线程 1
        User user = userMapper.selectById(1L);
        user.setUsername("rywDtest1");
        user.setEmail("24736743@qq.com");
        // 模拟另外一个线程执行了插队操作
        User user2 = userMapper.selectById(1L);
        user.setUsername("11111");
        user2.setEmail("24736743@qq.com");
        userMapper.updateById(user2);
        // 自旋锁来多次尝试提交!
        userMapper.updateById(user);// 如果没有乐观锁就会覆盖插队线程的值!
    }
    @Test// 测试查询
    public void testSelectById(){
        User user = userMapper.selectById(1450830897510109185L);
        System.out.println(user);
    }
    @Test// 测试批量查询id
    public void testSelectByBatchId(){
        List<User> users = userMapper.selectBatchIds(Arrays.asList(1, 2, 3));
        users.forEach(System.out::println);
    }
    @Test// 按条件查询之一使用map操作
    public void testSelectByBatchIds(){
        HashMap<String, Object> map = new HashMap<>(); // 自定义要查询
        map.put("name","狂神说Java");
        map.put("age",3);
        List<User> users = userMapper.selectByMap(map);
        users.forEach(System.out::println);
    }
    @Test// 测试分页查询
    public void testPage(){
// 参数一:当前页
// 参数二:页面大小
// 使用了分页插件之后，所有的分页操作也变得简单的!
        Page<User> page = new Page<>(2,3);
        userMapper.selectPage(page,null);
        page.getRecords().forEach(System.out::println);
        System.out.println(page.getTotal());
    }
    @Test	// 测试删除
    public void testDeleteById(){
        userMapper.deleteById(1453207204436934658L);
    }
    @Test	// 通过id批量删除
    public void testDeleteBatchId(){
        userMapper.deleteBatchIds(Arrays.asList(1240620674645544961L,1240620674645544962L));
    }
    @Test	// 通过map删除
    public void testDeleteMap(){
        HashMap<String, Object> map = new HashMap<>();
        map.put("name","狂神说Java");
        userMapper.deleteByMap(map);
    }


    //以下是wapper复杂条件
    @Test
    public void forgetpassword(){
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username","123qwa")            //并且关系
                .eq("email","345@qq.com");
        User user1 = userMapper.selectOne(wrapper);      //查询出来的值

        // 1、查询用户信息
        User user = userMapper.selectById(user1.getId());
        // 2、修改用户信息
        user.setPassword("test");
        // 3、执行更新操作
        userMapper.updateById(user);
    }


}
