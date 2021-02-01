package com.ruoyi.web.hydrology.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.web.hydrology.domain.WaterYieid;
import com.ruoyi.web.hydrology.service.WaterYieidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**水表用水量
 *
 */
@RestController
@RequestMapping("/hydrology/water")
public class WaterYieidController extends BaseController {
    @Autowired
    private WaterYieidService waterYieidService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(WaterYieid waterYieid){
        startPage();
        List<WaterYieid> list = waterYieidService.queryList(waterYieid);
        return getDataTable(list);
    }
}
