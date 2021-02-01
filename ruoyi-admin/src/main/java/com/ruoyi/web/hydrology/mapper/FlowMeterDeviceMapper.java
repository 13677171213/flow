package com.ruoyi.web.hydrology.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.web.hydrology.domain.FlowMeterDevice;

import java.util.List;

public interface FlowMeterDeviceMapper extends BaseMapper<FlowMeterDevice> {
    public List<FlowMeterDevice> queryList(FlowMeterDevice flowMeterDevice);
    public List<FlowMeterDevice> jwdList(FlowMeterDevice flowMeterDevice);
    public List<FlowMeterDevice> deviceList(FlowMeterDevice flowMeterDevice);
    public int insert(FlowMeterDevice flowMeterDevice);
    public int binding(FlowMeterDevice flowMeterDevice);


}
