package com.ruoyi.web.hydrology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.web.hydrology.domain.WaterMeter;

import java.util.List;

public interface WaterMeterMapper extends BaseMapper<WaterMeter> {
    public List<WaterMeter> queryList(WaterMeter waterMeter);
    public int getByCount(Integer id);
}
