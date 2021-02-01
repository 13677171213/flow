package com.ruoyi.web.hydrology.controller;

import com.alibaba.fastjson.JSONArray;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.web.hydrology.domain.FlowMeterDevice;
import com.ruoyi.web.hydrology.service.FlowMeterDeviceService;
import com.ruoyi.web.hydrology.service.WaterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.*;

/**
 * 流量计业务代码
 */
@RestController
@RequestMapping("/hydrology/device")
public class FlowMeterDeviceController extends BaseController {

        @Autowired
        private FlowMeterDeviceService flowMeterDeviceService;
        @Autowired
        private WaterService waterService;

        /**
         * 列表
         */
        @GetMapping("/list")
        @ResponseBody
        public TableDataInfo list(FlowMeterDevice flowMeterDevice)
        {
            startPage();
            List<FlowMeterDevice> list = flowMeterDeviceService.queryList(flowMeterDevice);
            return getDataTable(list);
        }

        /**
         * 详情
         */
        @GetMapping(value = "/{id}")
        public AjaxResult getInfo(@PathVariable String id)

        {
            return AjaxResult.success(flowMeterDeviceService.getById(id));
        }

        /**
         * 新增
         */
        @Log(title = "设备信息", businessType = BusinessType.INSERT)
        @PostMapping("/add")
        public AjaxResult add(@RequestBody FlowMeterDevice flowMeterDevice) throws Exception {
            flowMeterDevice.setCreateBy(SecurityUtils.getUsername());
            flowMeterDevice.setCreateTime(new Date());
            flowMeterDevice.setBinding("已绑定");
            return toAjax(flowMeterDeviceService.insert(flowMeterDevice));
        }

        /**
         * 修改
         */
        @Log(title = "设备信息", businessType = BusinessType.UPDATE)
        @PutMapping("/edit")
        public AjaxResult edit(@RequestBody FlowMeterDevice flowMeterDevice)
        {
            flowMeterDevice.setUpdateBy(SecurityUtils.getUsername());
            flowMeterDevice.setUpdateTime(new Date());
            return toAjax(flowMeterDeviceService.updateById(flowMeterDevice));
        }
        /**
         * 解除绑定
         */
        @Log(title = "设备解绑", businessType = BusinessType.UPDATE)
        @GetMapping("/binding/{id}")
        public AjaxResult binding(@PathVariable String id) throws Exception {
            FlowMeterDevice flowMeterDevice = flowMeterDeviceService.getById(id);
            flowMeterDevice.setBinding("未绑定");
            return toAjax(flowMeterDeviceService.binding(flowMeterDevice));
        }

    /**
     * 高德地图锚点展示
     */
        @GetMapping("/gddt")
        @ResponseBody
        public AjaxResult gdlist(FlowMeterDevice flowMeterDevice)
        {
            Map ret = new HashMap();
            List jwdList = flowMeterDeviceService.jwdList(flowMeterDevice);
            ret.put("jwdList",jwdList);
            return AjaxResult.success(ret);
        }

    //遍历所有的设备
    @GetMapping("/deviceList")
    public AjaxResult deviceList(FlowMeterDevice flowMeterDevice) {
        AjaxResult ajax = AjaxResult.success();
        List deviceList = flowMeterDeviceService.deviceList(flowMeterDevice);
        ajax.put("deviceList",deviceList);
        return ajax;
    }

        /**
         * 删除
         */
    @Log(title = "设备数据", businessType = BusinessType.DELETE)
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable String id){
        FlowMeterDevice flowMeterDevice = flowMeterDeviceService.getById(id);
        if(flowMeterDevice.getBinding().equals("未绑定")){
            return toAjax(flowMeterDeviceService.removeByIds(Arrays.asList(id)));
        }
            return AjaxResult.error("警告：设备"+flowMeterDevice.getDeviceName()+"已绑定,禁止删除！");
    }

}



