package com.ruoyi.web.hydrology.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.web.hydrology.domain.WaterMeter;
import com.ruoyi.web.hydrology.service.WaterMeterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/hydrology/meter")
public class WaterMeterController extends BaseController {
    @Autowired
    private WaterMeterService waterMeterService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(WaterMeter waterMeter)
    {
        startPage();
        List<WaterMeter> list = waterMeterService.queryList(waterMeter);
        return getDataTable(list);
    }
}
