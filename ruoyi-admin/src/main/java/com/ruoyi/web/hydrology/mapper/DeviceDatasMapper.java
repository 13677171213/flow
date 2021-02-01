package com.ruoyi.web.hydrology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.web.hydrology.domain.DeviceDatas;

import java.util.List;

public interface DeviceDatasMapper extends BaseMapper<DeviceDatas> {
    public List<DeviceDatas> queryList(DeviceDatas deviceDatas);
    public int getByTs(String ts);
    public List<DeviceDatas> echarList(DeviceDatas deviceDatas);
}
