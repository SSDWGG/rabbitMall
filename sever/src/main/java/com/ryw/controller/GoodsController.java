package com.ryw.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ryw.entity.*;
import com.ryw.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class GoodsController {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private GoodsimgMapper goodsimgMapper;
    @Autowired
    private SizerestcountMapper sizerestcountMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserinfoMapper userinfoMapper;
    @Autowired
    private UserorderMapper userorderMapper;

    @CrossOrigin
    @RequestMapping("/allgoodsinfo")            //查询全部
    public String getallgoodsinfo()
    {
        List<Goods> goodsList = goodsMapper.selectList(null);
        for (int i= 0; i<goodsList.size();i++){
           Long goodsid =  goodsList.get(i).getGoodsid();     //拿到goodsid查找到该goods的其他属性

            QueryWrapper<Goodsimg> wrappergoodsimg = new QueryWrapper<>();
            wrappergoodsimg.eq("goodsid",goodsid);
            List<Goodsimg> goodsimgList = goodsimgMapper.selectList(wrappergoodsimg);
            goodsList.get(i).setImglist(goodsimgList);

            QueryWrapper<Sizerestcount> wrappergoodssize = new QueryWrapper<>();
            wrappergoodssize.eq("goodsid",goodsid);
            List<Sizerestcount> sizerestcountList = sizerestcountMapper.selectList(wrappergoodssize);
            goodsList.get(i).setSizecountlist(sizerestcountList);

        }
        String userallinfo_json = JSON.toJSONString(goodsList);
        return userallinfo_json;
    }

    @RequestMapping("/getoutgoods")            //查询outgoods
    public String getoutgoods()
    {
        List<Goods> goodsList = goodsMapper.getoutgoods();
        for (int i= 0; i<goodsList.size();i++){
            Long goodsid =  goodsList.get(i).getGoodsid();     //拿到goodsid查找到该goods的其他属性

            QueryWrapper<Goodsimg> wrappergoodsimg = new QueryWrapper<>();
            wrappergoodsimg.eq("goodsid",goodsid);
            List<Goodsimg> goodsimgList = goodsimgMapper.selectList(wrappergoodsimg);
            goodsList.get(i).setImglist(goodsimgList);

            QueryWrapper<Sizerestcount> wrappergoodssize = new QueryWrapper<>();
            wrappergoodssize.eq("goodsid",goodsid);
            List<Sizerestcount> sizerestcountList = sizerestcountMapper.selectList(wrappergoodssize);
            goodsList.get(i).setSizecountlist(sizerestcountList);

        }
        String userallinfo_json = JSON.toJSONString(goodsList);
        return userallinfo_json;
    }

    @RequestMapping("/allgoodspagequery")   // 分页查询  和全部数据条数
    public String  allgoodspagequery(@RequestParam("pageNum") int pageNum  ,
                            @RequestParam("pageSize") int pageSize)
    {   //接收传来的参数，这里了封装一个实体类
        Page<Goods> page = new Page<>(pageNum,pageSize);
        goodsMapper.selectPage(page, null);
        List<Goods> goodslist  = page.getRecords();  //分页查询
        for(int i=0;i<goodslist.size();i++){
            QueryWrapper queryWrapper = new QueryWrapper();
            queryWrapper.eq("goodsid",goodslist.get(i).getGoodsid());
            List<Sizerestcount> sizerestcounts = sizerestcountMapper.selectList(queryWrapper);
            goodslist.get(i).setSizecountlist(sizerestcounts);
        }
        HashMap<String, Object> res = new HashMap<>();
        long numbers = page.getTotal();// 总条数
        res.put("numbers",numbers);
        res.put("data",goodslist);
        String json = JSON.toJSONString(res);
        return json;
    }


    @RequestMapping("/querygoods")
    public List<Goods>  querygoods(@RequestParam("goodsname") String goodsname)
    {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.like(goodsname!=null,"goodsname",goodsname);
        List<Goods> goodslist = goodsMapper.selectList(queryWrapper);
        return goodslist ;
    }

    @RequestMapping("/buy")
    public String buy(@RequestParam("userid") Long userid,
                      @RequestParam("goodsid") Long goodsid,
                      @RequestParam("size") String size)
    {
        /*
        * 拿到user对象     userinfo对象     goods对象  goodsimg对象  取出需要的属性存入order对象中
        * */
        QueryWrapper wrapperuser = new QueryWrapper();
        wrapperuser.eq("id",userid);
        User user = userMapper.selectOne(wrapperuser);

        Userinfo userinfo = userinfoMapper.selectOne(wrapperuser);

        QueryWrapper wrappergoods = new QueryWrapper();
        wrappergoods.eq("goodsid",goodsid);
       Goods goods = goodsMapper.selectOne(wrappergoods);

       List<Goodsimg> goodsimgList = goodsimgMapper.selectList(wrappergoods);

       Userorder userorder  = new Userorder();
       userorder.setId(userid);
       userorder.setGoodstitle(goods.getGoodstitle());
       userorder.setGoodsprice(goods.getPrice());

       userorder.setGoodsimg(goodsimgList.get(0).getGoodsimg());
       userorder.setAdress(userinfo.getAdress());
       userorder.setUsername(user.getUsername());
       userorder.setEmail(user.getEmail());
       userorder.setSize(size);
       userorderMapper.insert(userorder);

//       购买成功库存后续操作,库存减少,优惠券减少，销量加一等等
        countsub(goodsid,size);
        sellcount(goodsid);
        return "success";
    }

    @RequestMapping("/uploadgoodsimg")            //指定商品图片上传
    public String uploadgoodsimg(@RequestParam("file") MultipartFile file,
                              String goodsid)
    {
        Goodsimg goodsimg = new Goodsimg();
        //先写入数据库，再拿到一个生成的id，进行重命名再次写入，然后上传文件
        goodsimg.setGoodsid(Long.parseLong(goodsid));   //string类型转long
        goodsimg.setGoodsimg("test");               //暂存名字为test，随后条件查找goodsid和test
        goodsimgMapper.insert(goodsimg);
        //查找刚刚写入的数据，进行改写路径
        QueryWrapper<Goodsimg> wrapper = new QueryWrapper<>();
        wrapper.eq("goodsimg","test");
        Goodsimg goodsimg1 = goodsimgMapper.selectOne(wrapper);
        Long random = goodsimg1.getImgtableid();
        goodsimg1.setGoodsimg("/goodsimg/goodsimg"+goodsid+"("+random+").jpg");
        goodsimgMapper.updateById(goodsimg1);
        //上传文件
        File path = new File("/home/www/dist/goodsimg"); //服务器地址
        if(!path.exists()){
            path.mkdir();
        }
        File tofile = new File(path,"goodsimg"+goodsid+"("+random+").jpg");
        try {
            file.transferTo(tofile);
                return "success";
        }catch (IOException e){
            e.printStackTrace();
            return "false";
        }
    }

//    商品上新
    @RequestMapping("/addgoods")
    public String addgoods(@RequestParam("goodsname") String goodsname,
                      @RequestParam("category") String category,
                      @RequestParam("price") String price,
                      @RequestParam("goodsdescribe") String goodsdescribe,
                      @RequestParam("goodstitle") String goodstitle)
    {
        /*
        拿到参数的第一步转换类型
         * */
        Goods goods = new Goods();
        goods.setPrice(Float.parseFloat(price));
        goods.setNowprice(Float.parseFloat(price));
        goods.setGoodsname(goodsname);
        goods.setCategory(category);
        goods.setGoodsdescribe(goodsdescribe);
        goods.setGoodstitle(goodstitle);
        goodsMapper.insert(goods);
        return "success";
    }

//    商品修改
    @RequestMapping("/editgoods")
    public String editgoods(@RequestParam("goodsid") String goodsid,
                        @RequestParam("goodsname") String goodsname,
                       @RequestParam("category") String category,
                       @RequestParam("nowprice") String nowprice,
                       @RequestParam("goodsdescribe") String goodsdescribe,
                       @RequestParam("goodstitle") String goodstitle)
    {

    Goods goods = goodsMapper.selectById(Long.parseLong(goodsid));
    goods.setGoodsname(goodsname);
    goods.setCategory(category);
    double nowpriceold = goods.getNowprice();
    goods.setPrice(nowpriceold);
    goods.setNowprice(Float.parseFloat(nowprice));
    goods.setGoodsdescribe(goodsdescribe);
    goods.setGoodstitle(goodstitle);
    int result = goodsMapper.updateById(goods);

    if(result!=0){
        return "success";
    }
    return   "error";
}
    @RequestMapping("/addsizecount")            //添加尺码
    public String addsizecount(@RequestParam("goodsid") String goodsid,
                               @RequestParam("size") String size,
                               @RequestParam("count") String count)
    {
        //检查数据库中字符是否重复，类型转换，放入数据库
        QueryWrapper<Sizerestcount> wrapper = new QueryWrapper<>();
        wrapper.eq("size",size).eq("goodsid",goodsid);
        List<Sizerestcount> sizerestcounts = sizerestcountMapper.selectList(wrapper);
        if(sizerestcounts.size()==0){
            Sizerestcount sizerestcount = new Sizerestcount();
            sizerestcount.setSize(size);
            sizerestcount.setGoodsid(Long.parseLong(goodsid));
            sizerestcount.setRestcount(Integer.parseInt(count));
            sizerestcountMapper.insert(sizerestcount);
            return "success";
        }else{
            return "error";//size尺寸重复，如需修改size尺寸请移步修改数据
        }

    }


    @RequestMapping("/editsizecount")            //添加尺码
    public String editsizecount(@RequestParam("goodsid") String goodsid,
                               @RequestParam("size") String size,
                               @RequestParam("count") String count)
    {
        //检查数据库中字符是否重复，类型转换，放入数据库
        QueryWrapper<Sizerestcount> wrapper = new QueryWrapper<>();
        wrapper.eq("size",size).eq("goodsid",goodsid);
        Sizerestcount sizerestcountupdata = sizerestcountMapper.selectOne(wrapper);
        sizerestcountupdata.setRestcount(Integer.parseInt(count));
        int result=  sizerestcountMapper.updateById(sizerestcountupdata);
        if(result!=0){
            return "success";
        }
        return "false";
    }
    public void countsub(Long goodsid,String size)
    {
        QueryWrapper wrapper = new QueryWrapper();
        Map<String, Object> params = new HashMap<>();
        params.put("goodsid",goodsid);
        params.put("size",size);
        wrapper.allEq(params,false);
        Sizerestcount sizerestcount = sizerestcountMapper.selectOne(wrapper);
        int count = sizerestcount.getRestcount();
        count--;
        sizerestcount.setRestcount(count);
        sizerestcountMapper.update(sizerestcount,wrapper);
    }

    public void sellcount(Long goodsid)
    {
        Goods goods = goodsMapper.selectById(goodsid);
        int sellcount = goods.getSellcount();
        sellcount++;
        goods.setSellcount(sellcount);
        goodsMapper.updateById(goods);
    }
}
