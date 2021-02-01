package com.ruoyi.web.hydrology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.web.hydrology.domain.WaterValue;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * 水表示值数据表
 */
public interface WaterValueMapper extends BaseMapper<WaterValue> {
    public List<WaterValue> queryList(WaterValue waterValue);
    public int getByCount(@Param("readingDate")String readingDate, @Param("watermeterId")String watermeterId);
}
