import request from '@/utils/request'

// 查询订单信息列表
export function listOrderinfo(query) {
  return request({
    url: '/system/orderinfo/list',
    method: 'get',
    params: query
  })
}

// 查询订单信息详细
export function getOrderinfo(ono) {
  return request({
    url: '/system/orderinfo/' + ono,
    method: 'get'
  })
}

// 新增订单信息
export function addOrderinfo(data) {
  return request({
    url: '/system/orderinfo',
    method: 'post',
    data: data
  })
}

// 修改订单信息
export function updateOrderinfo(data) {
  return request({
    url: '/system/orderinfo',
    method: 'put',
    data: data
  })
}

// 删除订单信息
export function delOrderinfo(ono) {
  return request({
    url: '/system/orderinfo/' + ono,
    method: 'delete'
  })
}
