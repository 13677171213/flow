package com.ruoyi.web.hydrology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.web.hydrology.domain.WaterMeter;
import com.ruoyi.web.hydrology.domain.WaterYieid;

import java.util.List;

/**用水量
 *
 */
public interface WaterYieidMapper extends BaseMapper<WaterYieid> {
    public List<WaterYieid> queryList(WaterYieid waterYieid);
    public int getByCount(String readingDate);
}
