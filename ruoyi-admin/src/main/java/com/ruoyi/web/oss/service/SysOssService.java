/*
 * 项目名称:platform-plus
 * 类名称:SysOssService.java
 * 包名称:com.platform.modules.oss.service
 *
 * 修改履历:
 *      日期                修正者      主要内容
 *      2019/1/17 16:21    李鹏军      初版完成
 *
 * Copyright (c) 2019-2019 微同软件
 */
package com.ruoyi.web.oss.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.web.oss.domain.SysOss;

import java.util.List;

/**
 * 文件上传
 *
 * @author 李鹏军
 * @date 2019-01-17 16:21:01
 */
public interface SysOssService extends IService<SysOss> {

    /**
     * 分页查询
     *
     * @param params 查询参数
     * @return Page
     */
    List<SysOss> queryList(SysOss entity);
}
