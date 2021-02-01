package com.ruoyi.web.hydrology.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 水表示值数据表
 */
@Data
@TableName("hy_watervalue")
public class WaterValue extends BaseEntity {
        private String id;
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
        private Date readingDate;//抄读时间
        private Double readNumber;//抄读值
        private String watermeterName;//水表名称
        private int watermeterId;//水表ID
        private String address;
}
