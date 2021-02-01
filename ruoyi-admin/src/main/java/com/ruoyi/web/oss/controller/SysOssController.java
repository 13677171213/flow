/*
 * 项目名称:platform-plus
 * 类名称:SysOssController.java
 * 包名称:com.platform.modules.oss.controller
 *
 * 修改履历:
 *      日期                修正者      主要内容
 *      2019/1/17 16:21    李鹏军      初版完成
 *
 * Copyright (c) 2019-2019 微同软件
 */
package com.ruoyi.web.oss.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.web.oss.cloud.CloudStorageConfig;
import com.ruoyi.web.oss.cloud.UploadFactory;
import com.ruoyi.web.oss.domain.SysOss;
import com.ruoyi.web.oss.service.SysOssService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("sys/oss")
public class SysOssController extends BaseController {
    @Value("${oss.type}")
    private Integer type;
    @Value("${oss.qiniuDomain}")
    private String qiniuDomain;
    @Value("${oss.qiniuPrefix}")
    private String qiniuPrefix;
    @Value("${oss.qiniuAccessKey}")
    private String qiniuAccessKey;
    @Value("${oss.qiniuSecretKey}")
    private String qiniuSecretKey;
    @Value("${oss.qiniuBucketName}")
    private String qiniuBucketName;
    @Value("${oss.aliyunDomain}")
    private String aliyunDomain;
    @Value("${oss.aliyunPrefix}")
    private String aliyunPrefix;
    @Value("${oss.aliyunEndPoint}")
    private String aliyunEndPoint;
    @Value("${oss.aliyunAccessKeyId}")
    private String aliyunAccessKeyId;
    @Value("${oss.aliyunAccessKeySecret}")
    private String aliyunAccessKeySecret;
    @Value("${oss.aliyunBucketName}")
    private String aliyunBucketName;
    @Value("${oss.qcloudDomain}")
    private String qcloudDomain;
    @Value("${oss.qcloudPrefix}")
    private String qcloudPrefix;
    @Value("${oss.qcloudSecretId}")
    private String qcloudSecretId;
    @Value("${oss.qcloudSecretKey}")
    private String qcloudSecretKey;
    @Value("${oss.qcloudBucketName}")
    private String qcloudBucketName;
    @Value("${oss.diskPath}")
    private String diskPath;
    @Value("${oss.proxyServer}")
    private String proxyServer;
    @Autowired
    private SysOssService sysOssService;

    /**
     * 分页查询
     *
     * @param params 查询参数
     * @return RestResponse
     */
    @GetMapping("/list")

    public TableDataInfo getList(SysOss entity) {
        startPage();
        List<SysOss> list = sysOssService.queryList(entity);
        return getDataTable(list);
    }

    /**
     * 上传文件
     *
     * @param file file
     * @return RestResponse
     */
    @RequestMapping("/upload")
    public Object upload(@RequestParam(value = "file", required = false) MultipartFile file,
                         @RequestParam(value = "sourceId", required = false) String sourceId,
                         @RequestParam(value = "fileType", required = false) String fileType) throws Exception {
        if (null == file || file.isEmpty()) {
            throw new CustomException("上传文件不能为空");
        }
        CloudStorageConfig config = new CloudStorageConfig();
        config.setType(type);
        config.setAliyunAccessKeyId(aliyunAccessKeyId);
        config.setAliyunAccessKeySecret(aliyunAccessKeySecret);
        config.setAliyunBucketName(aliyunBucketName);
        config.setAliyunDomain(aliyunDomain);
        config.setAliyunEndPoint(aliyunEndPoint);
        config.setAliyunPrefix(aliyunPrefix);
        config.setDiskPath(diskPath);
        config.setProxyServer(proxyServer);
        // config.setQcloudAppId();
        config.setQcloudBucketName(qcloudBucketName);
        config.setQcloudDomain(qcloudDomain);
        config.setQcloudPrefix(qcloudPrefix);
        // config.setQcloudRegion();
        config.setQcloudSecretId(qcloudSecretId);
        config.setQcloudSecretKey(qcloudSecretKey);
        config.setQiniuAccessKey(qiniuAccessKey);
        config.setQiniuBucketName(qiniuBucketName);
        config.setQiniuDomain(qiniuDomain);
        config.setQiniuPrefix(qiniuPrefix);
        config.setQiniuSecretKey(qiniuSecretKey);
        // 上传文件
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String url = UploadFactory.build(config).uploadSuffix(file.getBytes(), suffix);
        String[] ttt = url.split("/");
        String fileName  = ttt[ttt.length-1];
        // 保存文件信息
        SysOss ossEntity = new SysOss();
        ossEntity.setSourceId(sourceId);
        ossEntity.setFileType(fileType);
        ossEntity.setFileName(file.getOriginalFilename());
        ossEntity.setUrl(url);
        ossEntity.setNewName(fileName);
        ossEntity.setCreateTime(new Date());
        ossEntity.setUpdateTime(new Date());
        ossEntity.setCreateBy(SecurityUtils.getUsername());
        ossEntity.setUpdateBy(SecurityUtils.getUsername());
        sysOssService.save(ossEntity);
        // 返回兼容UEditor的参数
        return AjaxResult.success().put("url", url).put("state", "SUCCESS").put("title", url).put("original", url);
    }

    /**
     * 删除文件上传记录
     *
     * @param ids ids
     * @return RestResponse
     */
    // @SysLog("删除文件上传记录")
    @PostMapping("/delete")
    public AjaxResult delete(@RequestBody String[] ids) {
        sysOssService.removeByIds(Arrays.asList(ids));
        return AjaxResult.success();
    }

    @GetMapping(value = "/show/{dateDir}/{fileName}")
    public void show(HttpServletRequest request,
                     HttpServletResponse response,
                     @PathVariable("dateDir") String dateDir,
                     @PathVariable("fileName") String fileName) {
        fileName = diskPath + "/" + dateDir + "/" + fileName;
        File file = new File(fileName);
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            byte[] data = new byte[(int) file.length()];
            int length = fis.read(data);
            if (fileName.toLowerCase().endsWith("png") || fileName.toLowerCase().endsWith("jpeg")
                    || fileName.toLowerCase().endsWith("bmp") || fileName.toLowerCase().endsWith("gif")
                    || fileName.toLowerCase().endsWith("jpg")) {
                response.setContentType("image/jpeg");
            } else if (fileName.toLowerCase().endsWith("pdf")) {
                response.setContentType(MediaType.APPLICATION_PDF_VALUE);
            } else {
                response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            }
            ServletOutputStream stream = response.getOutputStream();
            stream.write(data);
            stream.flush();
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
