package com.ruoyi.web.hydrology.domain;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.util.Date;
import java.util.List;

/**
 * 流量计设备表
 */
@Data
@TableName("hy_devices")
public class FlowMeterDevice extends BaseEntity {

    //主键id
    @TableId
    private String id;
    private String deviceName;//设备名
    private String deviceAlias;//设备别名
    private int lastTime;//上一次更新时间（时间戳表示）
    private int signals;//信号强度
    private int power;//电量
    private int readInt;//读取数据时间间隔
    private int reportInt;//上报时间间隔
    private int types;//传感器类型
    private String sync;//设备是否同步配置
    private String simid;//卡号
    private String version;//版本号
    private String devicePwd;//设备登录密码
    private String location;//经纬度
    private String binding;//设备是否绑定
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date tsTime;
    private String ts;
    private String val;
    private String tag;

//    private List<DeviceDatas> datas;

}
