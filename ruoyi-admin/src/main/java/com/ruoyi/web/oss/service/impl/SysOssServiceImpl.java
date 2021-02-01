/*
 * 项目名称:platform-plus
 * 类名称:SysOssServiceImpl.java
 * 包名称:com.platform.modules.oss.service.impl
 *
 * 修改履历:
 *      日期                修正者      主要内容
 *      2019/1/17 16:21    李鹏军      初版完成
 *
 * Copyright (c) 2019-2019 微同软件
 */
package com.ruoyi.web.oss.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.web.oss.domain.SysOss;
import com.ruoyi.web.oss.mapper.SysOssMapper;
import com.ruoyi.web.oss.service.SysOssService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysOssServiceImpl extends ServiceImpl<SysOssMapper, SysOss> implements SysOssService {

    @Override
    public List<SysOss> queryList(SysOss entity) {
        return baseMapper.queryList(entity);
    }
}
