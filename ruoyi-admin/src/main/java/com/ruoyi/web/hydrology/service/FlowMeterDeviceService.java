package com.ruoyi.web.hydrology.service;

import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.ruoyi.web.hydrology.domain.DeviceDatas;
import com.ruoyi.web.hydrology.domain.FlowMeterDevice;
import com.ruoyi.web.hydrology.mapper.DeviceDatasMapper;
import com.ruoyi.web.hydrology.mapper.FlowMeterDeviceMapper;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class FlowMeterDeviceService extends ServiceImpl<FlowMeterDeviceMapper, FlowMeterDevice> {

    @Autowired
    private FlowMeterDeviceMapper flowMeterDeviceMapper;
    @Autowired
    private DeviceDatasMapper deviceDatasMapper;
    public List<FlowMeterDevice> queryList(FlowMeterDevice flowMeterDevice) {
        return baseMapper.queryList(flowMeterDevice);
    }

    public List<FlowMeterDevice> jwdList(FlowMeterDevice flowMeterDevice) {
        return flowMeterDeviceMapper.jwdList(flowMeterDevice);
    }
    //设备绑定（新增）
    public int insert(FlowMeterDevice flowMeterDevice)  throws Exception{
        try {
            OkHttpClient okHttpClient = new OkHttpClient();
            Response response;
            String times = String.valueOf(new Date().getTime() / 1000);
            String sign ="zifeiyuXuHb21rVRJ5KdHJg"+times+"wdiot";
            String md5Str = DigestUtils.md5DigestAsHex(sign.getBytes());//签名加密
            String url = "https://api.wendaoiot.com:446/Monitor/Login?userName=zifeiyu&password=XuHb21rVRJ5KdHJg&ts="+times+"&sign="+md5Str+"";
            Request request = new Request.Builder().url(url).get().build();
            response = okHttpClient.newCall(request).execute();
            String loginData = response.body().string();//登录返回的数据转成String类型
            System.out.println("zxczxc"+loginData);
            JSONObject loginDatas = new JSONObject(loginData);//转换成json对象
            Object loginCode = loginDatas.get("code");//获取code
            //绑定设备
            Response responses;
            String signs = loginCode + flowMeterDevice.getDeviceName() + flowMeterDevice.getDevicePwd() + "wendaoiot#$%";//签名明文
            String md5Strs = DigestUtils.md5DigestAsHex(signs.getBytes());//签名加密
            String urls = "https://api.wendaoiot.com:446/Monitor/BindDevice?code=" + loginCode + "&deviceName="+flowMeterDevice.getDeviceName()+"&deviceAlias=" + flowMeterDevice.getDeviceAlias() + "&sign=" + md5Strs + "";
            Request requests = new Request.Builder().url(urls).get().build();
            responses = okHttpClient.newCall(requests).execute();
            String ret = responses.body().string();//登录返回的数据转成String类型
            JSONObject retcode = new JSONObject(ret);
            int retcodes= (int) retcode.get("retCode");
            if (retcodes <=-1){
                throw new Exception("设备绑定失败：设备名或密码错误！");
            }
            return flowMeterDeviceMapper.insert(flowMeterDevice);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return -1;
    }
    //设备解绑
    public int binding(FlowMeterDevice flowMeterDevice)  throws Exception{
            //解除绑定机器
        try{
            OkHttpClient okHttpClient = new OkHttpClient();
            Response response;
            String times = String.valueOf(new Date().getTime() / 1000);
            String sign ="zifeiyuXuHb21rVRJ5KdHJg"+times+"wdiot";
            String md5Str = DigestUtils.md5DigestAsHex(sign.getBytes());//签名加密
            String url = "https://api.wendaoiot.com:446/Monitor/Login?userName=zifeiyu&password=XuHb21rVRJ5KdHJg&ts="+times+"&sign="+md5Str+"";
            Request request = new Request.Builder().url(url).get().build();
            response = okHttpClient.newCall(request).execute();
            String loginData = response.body().string();//登录返回的数据转成String类型
            JSONObject loginDatas = new JSONObject(loginData);//转换成json对象
            Object loginCode = loginDatas.get("code");//获取code
            Response responses;
            String urls ="https://api.wendaoiot.com:446/Monitor/UnbindDevice?code="+loginCode+"&deviceName="+flowMeterDevice.getDeviceName()+"";
            Request requests = new Request.Builder().url(urls).get().build();
            responses = okHttpClient.newCall(requests).execute();
            JSONObject retcode = new JSONObject(responses.body().string());
            int ret = (int) retcode.get("retCode");
            if(ret<=-1){
                throw new Exception("警告：解除设备失败！请重试");
            }
            return flowMeterDeviceMapper.binding(flowMeterDevice);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
        //设备列表
    public List<FlowMeterDevice> deviceList(FlowMeterDevice flowMeterDevice) {
        return flowMeterDeviceMapper.deviceList(flowMeterDevice);

    }
}