package com.ruoyi.web.hydrology.TimesTask;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.web.hydrology.domain.*;
import com.ruoyi.web.hydrology.mapper.*;
import com.ruoyi.web.hydrology.service.DeviceDatasService;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.DigestUtils;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Component("deTask")
public class TimesTask {
    @Autowired
    private FlowMeterDeviceMapper flowMeterDeviceMapper;
    @Autowired
    private DeviceDatasMapper deviceDatasMapper;
    @Autowired
    private WaterMeterMapper waterMeterMapper;
    @Autowired
    private WaterYieidMapper waterYieidMapper;
    @Autowired
    private WaterValueMapper waterValueMapper;

    public void dTask() throws IOException, ParseException {

        FlowMeterDevice flowMeterDevice = new FlowMeterDevice();
        List<FlowMeterDevice> deviceLists = flowMeterDeviceMapper.deviceList(flowMeterDevice);
        String times = String.valueOf(new Date().getTime() / 1000);
        String sign = "zifeiyuXuHb21rVRJ5KdHJg" + times + "wdiot";
        String md5Str = DigestUtils.md5DigestAsHex(sign.getBytes());
        OkHttpClient okHttpClient = new OkHttpClient();
        Response response;

        String url = "https://api.wendaoiot.com:446/Monitor/Login?userName=zifeiyu&password=XuHb21rVRJ5KdHJg&ts=" + times + "&sign=" + md5Str + "";
        Request request = new Request.Builder().url(url).get().build();
        response = okHttpClient.newCall(request).execute();
        String a = response.body().string();
        JSONObject jso = JSON.parseObject(a);//json字符串转换成jsonobject对象
        Object code = jso.get("code");
        for (int i = 0; i < deviceLists.size(); i++) {
            String deviceName = deviceLists.get(i).getDeviceName();
            String deviceId = deviceLists.get(i).getId();
            Response responsss;
            String url1 = "https://api.wendaoiot.com:446/Monitor/GetDatas?code=" + code + "&deviceName=" + deviceName + "&num=1";
            Request requestsss = new Request.Builder().url(url1).get().build();
            responsss = okHttpClient.newCall(requestsss).execute();
            String lists = responsss.body().string();//获取当前取得的数据字符串
            JSONObject jsos = JSON.parseObject(lists);//将字符串转成json对象
            JSONObject val = jsos.getJSONArray("datas").getJSONObject(0);
            JSONArray datalist = val.getJSONArray("vals");
            DeviceDatas deviceDatas = new DeviceDatas();

                int c = deviceDatasMapper.getByTs(datalist.getJSONObject(0).get("ts").toString());
                if (c <= 0) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String timeStamp = datalist.getJSONObject(0).get("ts").toString();
                    long tsss = Long.valueOf(timeStamp) * 1000;
                    String sd = sdf.format(tsss);
                    Date date = sdf.parse(sd);
                    UUID uuid = UUID.randomUUID();
                    deviceDatas.setId(uuid.toString());
                    deviceDatas.setTag("wl");
                    deviceDatas.setDeviceAlias(deviceLists.get(i).getDeviceAlias());
                    deviceDatas.setDeviceName(deviceName);
                    deviceDatas.setVal(datalist.getJSONObject(0).get("val").toString());
                    deviceDatas.setTs(datalist.getJSONObject(0).get("ts").toString());
                    deviceDatas.setTsTime(date);
                    deviceDatasMapper.insert(deviceDatas);
                    FlowMeterDevice datas = flowMeterDeviceMapper.selectById(deviceId);
                    datas.setVal(datalist.getJSONObject(0).get("val").toString());
                    datas.setTs(datalist.getJSONObject(0).get("ts").toString());
                    datas.setTsTime(date);
                    flowMeterDeviceMapper.updateById(datas);
                }
            }

    }

    //水表设备（未指明）
    public void mTask() throws IOException {
        Response respons;
        String url = "http://externalapi.nh.yunjichaobiao.com/api/Account/Login";
        OkHttpClient okHttpClient = new OkHttpClient();
        RequestBody formBody = new FormBody.Builder()
                .add("UserID", "13307208008")
                .add("Password", "123456")
                .add("client", "0")
                .add("ReturnType", "json")
                .build();
        Request request = new Request.Builder().url(url).post(formBody).build();
        respons = okHttpClient.newCall(request).execute();
        String loginList = respons.body().string();
        JSONObject loginJson = JSON.parseObject(loginList);
        String Token = loginJson.getString("Token");
        Response response;
        String urls = "http://externalapi.nh.yunjichaobiao.com/api/SetMeter/GetWatermeterListForPage";
        RequestBody formBodys = new FormBody.Builder()
                .add("pageIndex", "1")
                .add("pageSize", "30")
                .add("areaID", "0")
                .add("watermeterID", "0")
                .add("meterInState", "0,1,2,100")
                .add("focusName", "")
                .add("ReturnType", "json")
                .build();
        Request requests = new Request.Builder().url(urls)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", "Bearer " + Token)
                .post(formBodys).build();

        response = okHttpClient.newCall(requests).execute();
        String waterMeterList = response.body().string();
        JSONObject waterMeterJson = JSON.parseObject(waterMeterList);
        JSONArray dataJsonArray = waterMeterJson.getJSONObject("Data").getJSONArray("list");
        WaterMeter waterMeter = new WaterMeter();
        for (int i = 0; i < dataJsonArray.size(); i++) {
            //水表设备数据重复过滤
            int count = waterMeterMapper.getByCount((Integer) dataJsonArray.getJSONObject(i).get("ID"));
            if (count <= 0) {
                waterMeter.setId((String) dataJsonArray.getJSONObject(i).get("ID"));
                waterMeter.setParentId((Integer) dataJsonArray.getJSONObject(i).get("ParentID"));
                waterMeter.setTypeName(dataJsonArray.getJSONObject(i).get("TypeName").toString());
                waterMeter.setAddress(dataJsonArray.getJSONObject(i).get("Address").toString());
                waterMeter.setMeterType(dataJsonArray.getJSONObject(i).get("MeterType").toString());
                waterMeter.setPayPlanId(dataJsonArray.getJSONObject(i).get("PayPlanID").toString());
                waterMeter.setProjectId(dataJsonArray.getJSONObject(i).get("ProjectID").toString());
                waterMeter.setCanDelete(dataJsonArray.getJSONObject(i).get("CanDelete").toString());
                waterMeter.setName(dataJsonArray.getJSONObject(i).get("Name").toString());
                waterMeter.setAreaName(dataJsonArray.getJSONObject(i).get("AreaName").toString());
                waterMeter.setPlanType(dataJsonArray.getJSONObject(i).get("PlanType").toString());
                waterMeter.setSort(dataJsonArray.getJSONObject(i).get("Sort").toString());
                waterMeter.setFocusId(dataJsonArray.getJSONObject(i).get("FocusID").toString());
                waterMeter.setPassword(dataJsonArray.getJSONObject(i).get("Password").toString());
                waterMeter.setFocusName(dataJsonArray.getJSONObject(i).get("FocusName").toString());
                waterMeter.setLineState(dataJsonArray.getJSONObject(i).get("LineState").toString());
                waterMeter.setAreaId(dataJsonArray.getJSONObject(i).get("AreaID").toString());
                waterMeter.setCode(dataJsonArray.getJSONObject(i).get("Code").toString());
                waterMeter.setStateDesc(dataJsonArray.getJSONObject(i).get("StateDesc").toString());
                waterMeter.setState(dataJsonArray.getJSONObject(i).get("State").toString());
                waterMeter.setLinkType(dataJsonArray.getJSONObject(i).get("LinkType").toString());
                waterMeter.setMeterType(dataJsonArray.getJSONObject(i).get("AreaID").toString());
                waterMeter.setLocation(dataJsonArray.getJSONObject(i).get("Location").toString());
                waterMeter.setCollectorAddress(dataJsonArray.getJSONObject(i).get("CollectorAddress").toString());
                waterMeter.setIsSend(dataJsonArray.getJSONObject(i).get("IsSend").toString());
                waterMeter.setIsSendDesc(dataJsonArray.getJSONObject(i).get("IsSendDesc").toString());
                waterMeterMapper.insert(waterMeter);
            }
        }
    }

    //获取水表数据（一天一提交）
    public void mDataTask() {
        try{
            Response respons;
            String url = "http://externalapi.nh.yunjichaobiao.com/api/Account/Login";
            OkHttpClient okHttpClient = new OkHttpClient();
            RequestBody formBody = new FormBody.Builder()
                    .add("UserID", "13307208008")
                    .add("Password", "123456")
                    .add("client", "0")
                    .add("ReturnType", "json")
                    .build();
            Request request = new Request.Builder().url(url).post(formBody).build();
            respons = okHttpClient.newCall(request).execute();
            String loginList = respons.body().string();//获取返回值并转String类型
            JSONObject loginJson = JSON.parseObject(loginList);//返回值转成Json对象
            String Token = loginJson.getString("Token");//获取当前Token
            Response response;
            WaterMeter waterMeter = new WaterMeter();//new出一个水表设备对象
            List<WaterMeter> waterMeterData = waterMeterMapper.queryList(waterMeter);//遍历出水表设备的列表
            Date startTime = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//定义时间格式
            String startTimes = sdf.format(startTime);//获取String类型的时间
            for (int i = 0; i < waterMeterData.size(); i++) {//将水表设备进行for循环
                String uuid = UUID.randomUUID().toString().replaceAll("-", "");//定义uuid
                String urls = "http://externalapi.nh.yunjichaobiao.com/api/Monitor/PageForUseWater";
                RequestBody formBodys = new FormBody.Builder()
                        .add("pageIndex", "1")//当前第一页
                        .add("pageSize", "15")//第一页显示的数据
                        .add("areaID", "0")
                        .add("dateType", "D")
                        .add("watermeterID", waterMeterData.get(i).getId())//水表id
                        .add("startTime", startTimes)//当前时间(年月日)
                        .add("endTime", "2099-01-01")
                        .add("ReturnType", "json")
                        .build();
                Request requests = new Request.Builder().url(urls)
                        .addHeader("Content-Type", "application/json")
                        .addHeader("Authorization", "Bearer " + Token)
                        .post(formBodys).build();
                response = okHttpClient.newCall(requests).execute();
                String waterMeterList = response.body().string();//水表数据
                System.out.println("水表用水量数据"+waterMeterList);
                JSONObject waterMeterJsonObject = JSON.parseObject(waterMeterList);//用水量数据转成json对象
                JSONArray waterMeterJsonArray = waterMeterJsonObject.getJSONObject("Data").getJSONArray("list");//取出用水量的数组
                if (waterMeterJsonArray.size() > 0) {//数组非空判断
                    //进行数据重复的过滤操作
                    int count = waterYieidMapper.getByCount(waterMeterJsonArray.getJSONObject(0).get("ReadingDate").toString());
                    if (count <= 0) {
                        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");//定义时间格式
                        Date date = format.parse((String) waterMeterJsonArray.getJSONObject(0).get("ReadingDate"));//获取的设备数据
                        WaterYieid waterYieid = new WaterYieid();
                        waterYieid.setAddress(waterMeterJsonArray.getJSONObject(0).get("Address").toString());
                        waterYieid.setAreaId((Integer) waterMeterJsonArray.getJSONObject(0).get("AreaID"));
                        waterYieid.setMeterBrand(waterMeterJsonArray.getJSONObject(0).get("MeterBrand").toString());
                        waterYieid.setMeterType(waterMeterJsonArray.getJSONObject(0).get("MeterType").toString());
                        waterYieid.setWatermeterId((Integer) waterMeterJsonArray.getJSONObject(0).get("WatermeterID"));
                        waterYieid.setId(uuid);
                        String value = waterMeterJsonArray.getJSONObject(0).get("Value").toString();
                        System.out.println(value);
                        double values = Double.parseDouble(value);
                        waterYieid.setValue(values);
                        waterYieid.setReadingDate(date);
                        waterYieid.setWatermeterName(waterMeterJsonArray.getJSONObject(0).get("WatermeterName").toString());
                        waterYieidMapper.insert(waterYieid);
                    }
                }
        }
            }catch (IOException | ParseException e) {
                e.printStackTrace();
            }
    }

    /**水表示值(一小时一提交)
     *
     * @throws IOException
     * @throws ParseException
     */
    public void waterValue() throws  IOException,ParseException {
        Response respons;
        String url = "http://externalapi.nh.yunjichaobiao.com/api/Account/Login";
        OkHttpClient okHttpClient = new OkHttpClient();
        RequestBody formBody = new FormBody.Builder()
                .add("UserID", "13307208008")
                .add("Password", "123456")
                .add("client", "0")
                .add("ReturnType", "json")
                .build();
        Request request = new Request.Builder().url(url).post(formBody).build();
        respons = okHttpClient.newCall(request).execute();
        String loginList = respons.body().string();//返回值转String
        JSONObject loginJson = JSON.parseObject(loginList);//String转Json对象
        String Token = loginJson.getString("Token");//取出对象中的Token
        Response response;
        WaterMeter waterMeter = new WaterMeter(); //new出一个对象
        List<WaterMeter> waterMeterData = waterMeterMapper.queryList(waterMeter);//遍历出水表设备
        Date startTime = new Date();//获取当前时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//定义时间格式
        String startTimes = sdf.format(startTime);//获取String类型的时间
        for (int i = 0; i < waterMeterData.size(); i++) {//循环出每个设备
            String urls="http://externalapi.nh.yunjichaobiao.com/api/Monitor/PageForWaterRawData";
            RequestBody formBodys = new FormBody.Builder()
                    .add("pageIndex","1")//查询第一页
                    .add("pageSize","30")//每页显示30条
                    .add("areaID","0")//水表区域id
                    .add("dateType","H")//查询时间格式
                    .add("watermeterID",waterMeterData.get(i).getId())//遍历出的水表
                    .add("startTime",startTimes+" 00:00")//查询开始时间
                    .add("endTime","2099-01-01 00:00")//查询结束时间
                    .add("ReturnType","json")//数据类型为Json
                    .build();
            Request requests = new Request.Builder().url(urls)
                    .addHeader("Content-Type", "application/json")//post提交当时的表头设置
                    .addHeader("Authorization", "Bearer " + Token)//token可变
                    .post(formBodys).build();
            response = okHttpClient.newCall(requests).execute();
            String waterValueList = response.body().string();//查询水表示值得返回值转成String
            JSONObject waterValueJsonObject =  JSON.parseObject(waterValueList);//转成json对象
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");//定义时间格式
            JSONArray waterValueJsonArray = waterValueJsonObject.getJSONObject("Data").getJSONArray("list");//获取json对象里面的数组
             if(waterValueJsonArray.size() > 0) {//判断数组是否为空。为空则跳出，否则执行for循环
                 for (int j = 0; j < waterValueJsonArray.size(); j++) {
                     //将时间和水表名称进行查询判断是否重复插入
                     int count = waterValueMapper.getByCount(waterValueJsonArray.getJSONObject(j).get("ReadingDate").toString(),waterValueJsonArray.getJSONObject(j).get("WatermeterID").toString());
                     if (count <= 0) {
                         //自定义uuid
                         String uuid = UUID.randomUUID().toString().replaceAll("-", "");
                         WaterValue waterValue = new WaterValue();//new出水表示值对象
                         Date date = format.parse((String) waterValueJsonArray.getJSONObject(j).get("ReadingDate"));//获取当前时间转成时间格式
                         waterValue.setId(uuid);
                         waterValue.setReadingDate(date);
                         waterValue.setWatermeterId((Integer) waterValueJsonArray.getJSONObject(j).get("WatermeterID"));
                         waterValue.setWatermeterName((String) waterValueJsonArray.getJSONObject(j).get("WatermeterName"));
                         String value = waterValueJsonArray.getJSONObject(j).get("ReadNumber").toString();
                         double values = Double.parseDouble(value);//将value数据进行格式转换
                         waterValue.setReadNumber(values);
                         waterValue.setAddress(waterValueJsonArray.getJSONObject(j).get("Address").toString());
                         waterValueMapper.insert(waterValue);//执行插入方法
                     }
                 }
             }
        }
    }

}
