package com.ruoyi.web.hydrology.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.web.hydrology.domain.DeviceDatas;
import com.ruoyi.web.hydrology.service.DeviceDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 闻道设备数据业务代码
 */
@RestController
@RequestMapping("/hydrology/datas")
public class DeviceDatasController extends BaseController {
    @Autowired
    private DeviceDatasService deviceDatasService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(DeviceDatas deviceDatas)
    {
        startPage();
        List<DeviceDatas> list = deviceDatasService.queryList(deviceDatas);
        return getDataTable(list);
    }

    /**
     * echarts数据
     */
    @GetMapping("/echarList")
    @ResponseBody
    public AjaxResult echarList(DeviceDatas deviceDatas)
    {
        Map ret = new HashMap();
        List echarList = deviceDatasService.echarList(deviceDatas);
        ret.put("echarList",echarList);
        return AjaxResult.success(ret);
    }

    /**
     * 删除
     */
    @Log(title = "设备数据", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(deviceDatasService.removeByIds(Arrays.asList(ids)));
    }

}
