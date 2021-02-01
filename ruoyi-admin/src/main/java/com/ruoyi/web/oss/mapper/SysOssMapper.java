/*
 * 项目名称:platform-plus
 * 类名称:SysOssDao.java
 * 包名称:com.platform.modules.oss.dao
 *
 * 修改履历:
 *     日期                       修正者        主要内容
 *     2019-01-22 10:20:20        李鹏军     初版做成
 *
 * Copyright (c) 2018-2019 微同软件
 */
package com.ruoyi.web.oss.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.web.oss.domain.SysOss;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 文件上传Dao
 *
 * @author 李鹏军
 * @date 2019-01-22 10:20:20
 */
@Mapper
public interface SysOssMapper extends BaseMapper<SysOss> {

    /**
     * 自定义分页查询
     *
     * @param page   分页参数
     * @param params 查询参数
     * @return
     */
    List<SysOss> queryList(SysOss entity);
}
