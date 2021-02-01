package com.ruoyi.web.hydrology.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.hydrology.domain.WaterYieid;
import com.ruoyi.web.hydrology.mapper.WaterYieidMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**用水量
 *
 */
@Service
public class WaterYieidService extends ServiceImpl<WaterYieidMapper, WaterYieid> {

    public List<WaterYieid> queryList(WaterYieid waterYieid) {
        return baseMapper.queryList(waterYieid);
    }

}
