import request from '@/utils/request'

// 查询经纬度
export function getjwdList(query) {
  return request({
    url: '/hydrology/device/gddt',
    method: 'get',
    params: query
  })
}
export function getJkList(query) {
    return request({
      url: '/hydrology/mon/gddt',
      method: 'get',
      params: query
    })
}

//设备的最新数据信息
export function getDeviceData(deviceName) {
  return request({
    url: '/hydrology/datas/deviceData',
    method: 'get',
    params: {deviceName:deviceName}
  })
}