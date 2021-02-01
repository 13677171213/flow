import request from '@/utils/request'

// 查询echarts图     
export function getEcharList(query) {
  return request({
    url: '/hydrology/flow/echarList',
    method: 'get',
    params: query
  })
}