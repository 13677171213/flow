package com.ruoyi.web.hydrology.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.hydrology.domain.WaterValue;
import com.ruoyi.web.hydrology.mapper.WaterValueMapper;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * 水表示值数据表
 */
@Service
public class WaterValueService extends ServiceImpl<WaterValueMapper, WaterValue> {

    public List<WaterValue> queryList(WaterValue waterValue) {
        return baseMapper.queryList(waterValue);
    }
}
