package com.ruoyi.web.hydrology.service;






import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.web.hydrology.domain.WaterMeter;
import com.ruoyi.web.hydrology.domain.WaterYieid;
import com.ruoyi.web.hydrology.mapper.WaterMeterMapper;
import com.ruoyi.web.hydrology.mapper.WaterYieidMapper;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.sql.SQLOutput;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class TestService {
    private static WaterMeterService waterMeterMapper;

    public static void main(String[] args) throws IOException, ParseException {
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
        String urls = "http://externalapi.nh.yunjichaobiao.com/api/Monitor/PageForWaterRawData";
        RequestBody formBodys = new FormBody.Builder()
                .add("pageIndex", "1")
                .add("pageSize", "30")
                .add("areaID", "0")
                .add("dateType", "H")
                .add("watermeterID", "614")
                .add("startTime", "2021-01-28 00:00")
                .add("endTime", "2099-01-01 00:00")
                .add("ReturnType", "json")
                .build();
        Request requests = new Request.Builder().url(urls)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", "Bearer " + Token)
                .post(formBodys).build();
        response = okHttpClient.newCall(requests).execute();
        String waterMeterList = response.body().string();

        JSONObject waterMeterJsonObject = JSON.parseObject(waterMeterList);
        JSONArray waterMeterJsonArray = waterMeterJsonObject.getJSONObject("Data").getJSONArray("list");

//            waterMeterJsonArray.getJSONObject(0).get("ReadingDate");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    }




}
