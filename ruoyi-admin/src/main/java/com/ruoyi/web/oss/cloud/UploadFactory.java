
package com.ruoyi.web.oss.cloud;

public final class UploadFactory {

    public static AbstractCloudStorageService build(CloudStorageConfig config) {
        //获取云存储配置信息
        //CloudStorageConfig config = SpringCon;

        if (config.getType() == 1) {
            return new QiniuCloudStorageService(config);
        } else if (config.getType() == 2) {
            return new AliyunCloudStorageService(config);
        } else if (config.getType() == 3) {
            return new QcloudCloudStorageService(config);
        } else if (config.getType() == 4) {
            return new DiskCloudStorageService(config);
        }

        return null;
    }

}
