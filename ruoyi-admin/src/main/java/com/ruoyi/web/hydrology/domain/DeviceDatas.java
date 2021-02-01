package com.ruoyi.web.hydrology.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 流量计数据表
 */
@Data
@TableName("hy_datas")
public class DeviceDatas extends BaseEntity {
        private String id;
        private String tag;//数据标签
        private String val;//数值
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private Date tsTime;//时间
        private String ts;//时间戳
        private String deviceName;//设备编号
        private String deviceAlias;//设备名称
}
