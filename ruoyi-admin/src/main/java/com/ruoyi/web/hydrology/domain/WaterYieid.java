package com.ruoyi.web.hydrology.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 用水量数据表
 */
@Data
@TableName("hy_wateryieid")
public class WaterYieid extends BaseEntity {
        private String id;
        private String address;//水表地址
        private String meterType;//水表类型
        @JsonFormat(pattern = "yyyy-MM-dd")
        private Date readingDate;//抄读时间
        private Double value;//用水量
        private int areaId;//区域ID
        private String watermeterName;//水表名称
        private String meterBrand;//水表品牌
        private int watermeterId;//水表ID
}
