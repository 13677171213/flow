package com.ruoyi.web.hydrology.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.web.hydrology.domain.WaterValue;
import com.ruoyi.web.hydrology.domain.WaterYieid;
import com.ruoyi.web.hydrology.service.WaterValueService;
import com.ruoyi.web.hydrology.service.WaterYieidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 *水表示值
 */
@RestController
@RequestMapping("/hydrology/value")
public class WaterValueController extends BaseController {
    @Autowired
    private WaterValueService waterValueService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(WaterValue waterValue){
        startPage();
        List<WaterValue> list = waterValueService.queryList(waterValue);
        return getDataTable(list);
    }
}
