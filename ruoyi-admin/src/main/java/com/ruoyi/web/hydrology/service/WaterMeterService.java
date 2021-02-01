package com.ruoyi.web.hydrology.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.hydrology.domain.WaterMeter;
import com.ruoyi.web.hydrology.mapper.WaterMeterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WaterMeterService extends ServiceImpl<WaterMeterMapper, WaterMeter> {
    @Autowired
    private WaterMeterMapper waterMeterMapper;
    public List<WaterMeter> queryList(WaterMeter waterMeter) {
        return baseMapper.queryList(waterMeter);
    }
}
