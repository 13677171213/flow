package com.ruoyi.web.hydrology.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.hydrology.domain.DeviceDatas;
import com.ruoyi.web.hydrology.mapper.DeviceDatasMapper;
import com.ruoyi.web.hydrology.mapper.FlowMeterDeviceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DeviceDatasService extends ServiceImpl<DeviceDatasMapper, DeviceDatas> {
    @Autowired
    private DeviceDatasMapper deviceDatasMapper;
       public List<DeviceDatas> queryList(DeviceDatas deviceDatas){
           return deviceDatasMapper.queryList(deviceDatas);
       }
        public List<DeviceDatas> echarList(DeviceDatas deviceDatas) {
            return deviceDatasMapper.echarList(deviceDatas);
        }

}
