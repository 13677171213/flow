package com.ruoyi.web.hydrology.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 水表档案
 */
@Data
@TableName("hy_watermeter")
public class WaterMeter extends BaseEntity {
        private String  id;
        private int parentId;
        private String typeName;//类型名称
        private String address;//水表地址
        private String meterType;//设备类型（水表、流量计）
        private String payPlanId;
        private String projectId;
        private String canDelete;
        private String name;//水表名称
        private String areaName;//管理区域
        private String planType;
        private String sort;
        private String focusId;//所属终端
        private String haveValve;
        private String password;//水表密码
        private String focusName;
        private String lineState;
        private String areaId;
        private String code;
        private String stateDesc;//水表状态描述(0 新装, 1 运行, 2 暂停, 100 销表)
        private String state;
        private String linkType;//通讯方案 （如："RS-485"，"GPRS", "NB-IoT"等 ）
        private String location;
        private String collectorAddress;//采集器地址
        private String isSend;
        private String isSendDesc;//下发状态(未下发， 已下发)
}
