/*
 * 项目名称:platform-plus
 * 类名称:SysOssEntity.java
 * 包名称:com.platform.modules.oss.entity
 *
 * 修改履历:
 *      日期                修正者      主要内容
 *      2019/1/17 16:23    李鹏军      初版完成
 *
 * Copyright (c) 2019-2019 微同软件
 */
package com.ruoyi.web.oss.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("sys_oss")
public class SysOss extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @TableId
    private String id;

    private String sourceId;
    /**
     * URL地址
     */
    private String url;
    /**
     * 创建时间
     */
    private String fileName;
    private String newName;
    private String fileType;
}
