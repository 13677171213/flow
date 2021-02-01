package com.ruoyi.web.hydrology.service;





import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.web.controller.tool.TestController;
import com.ruoyi.web.hydrology.domain.DeviceDatas;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import com.alibaba.fastjson.JSON;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class WaterService {

    public static void main(String[] args){

        String times = String.valueOf(new Date().getTime() / 1000);
        String sign ="zifeiyuXuHb21rVRJ5KdHJg"+times+"wdiot";
        String md5Str = DigestUtils.md5DigestAsHex(sign.getBytes());
        OkHttpClient okHttpClient = new OkHttpClient();
        Response response;

        String url = "https://api.wendaoiot.com:446/Monitor/Login?userName=zifeiyu&password=XuHb21rVRJ5KdHJg&ts="+times+"&sign="+md5Str+"";
        Request request = new Request.Builder().url(url).get().build();
        try {

            response = okHttpClient.newCall(request).execute();
            String a = response.body().string();
            JSONObject jso=JSON.parseObject(a);//json字符串转换成jsonobject对象
            Object code = jso.get("code");

//            //绑定设备
//            Response responses;
//            String deviceName ="wl120002";
//            String deviceAlias ="测试2号机器";
//            String password ="eE2kwcWA";
//            //md5加密
//
//            String signs =code+deviceName+password+"wendaoiot#$%";
//            String md5Strs = DigestUtils.md5DigestAsHex(signs.getBytes());
//            String urls ="https://api.wendaoiot.com:446/Monitor/BindDevice?code="+code+"&deviceName="+deviceName+"&deviceAlias="+deviceAlias+"&sign="+md5Strs+"";
//            Request requests = new Request.Builder().url(urls).get().build();
//            responses = okHttpClient.newCall(request).execute();
//            String as = responses.body().string();
//            System.out.println("sdsd"+as);
            //解除绑定机器
//            Response responses;
//            String deviceName ="wl120002";
//            String urls ="https://api.wendaoiot.com:446/Monitor/UnbindDevice?code="+code+"&deviceName="+deviceName+"";
//            Request requests = new Request.Builder().url(urls).get().build();
//            responses = okHttpClient.newCall(requests).execute();
//            System.out.println(responses.body().string());
//            //更新绑定机器
//            Response responses;
//            String deviceName ="wl120004";
//            String urls ="https://api.wendaoiot.com:446/Monitor/UnbindDevice?code="+jsonObject.get("code")+"&deviceName="+deviceName+"";
//            Request requests = new Request.Builder().url(urls).get().build();
//            responses = okHttpClient.newCall(requests).execute();
//            System.out.println(responses.body().string());
            /**
             * 获取设备数据
             */

            Response responsss;
            String url1= "https://api.wendaoiot.com:446/Monitor/GetDatas?code="+code+"&deviceName=wl120001&num=2";
            Request requestsss = new Request.Builder().url(url1).get().build();
            responsss = okHttpClient.newCall(requestsss).execute();
            String lists = responsss.body().string();//获取当前取得的数据字符串
            JSONObject jsos=JSON.parseObject(lists);//将字符串转成json对象
            JSONObject val = jsos.getJSONArray("datas").getJSONObject(0);
            JSONArray datalist = val.getJSONArray("vals");
            DeviceDatas deviceDatas = new DeviceDatas();
            for(int i=0;i<datalist.size();i++) {
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String timeStamp = datalist.getJSONObject(i).get("ts").toString();
                long tsss = Long.valueOf(timeStamp)*1000;
                String sd = sdf.format(tsss);
                Date date = sdf.parse(sd);
                // 时间戳转换成时间
                System.out.println("shijian"+date);

//                String ddd=String.valueOf(dd);
//                System.out.println(ddd);
//                Date dates = new Date(dd*1000);
////                System.out.println(date);
//                System.out.println(date);
                UUID uuid = UUID.randomUUID();
                deviceDatas.setId(uuid.toString());
                deviceDatas.setTag("wl");
                deviceDatas.setVal(datalist.getJSONObject(i).get("val").toString());
                deviceDatas.setTs(datalist.getJSONObject(i).get("ts").toString());
                System.out.println("jashdjhskjhdkjashkjshakdjh");
                System.out.println(deviceDatas);
            }

            /**
             * 获取设备列表
             */
//            Response responsess;
//            String strURL ="https://api.wendaoiot.com:446/Monitor/GetDevices?code="+code+"";
//            Request requestss = new Request.Builder().url(strURL).get().build();
//            responsess = okHttpClient.newCall(requestss).execute();
//
//            String list =  responsess.body().string();
////            JSONObject jsonObjects = new JSONObject(list);
//            System.out.println(list);


        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
    }



}
