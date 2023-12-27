import request from '@/utils/request'

// 查询订单对象信息列表
export function listOrderiteminfo(query) {
  return request({
    url: '/system/orderiteminfo/list',
    method: 'get',
    params: query
  })
}

// 查询订单对象信息详细
export function getOrderiteminfo(ino) {
  return request({
    url: '/system/orderiteminfo/' + ino,
    method: 'get'
  })
}

// 新增订单对象信息
export function addOrderiteminfo(data) {
  return request({
    url: '/system/orderiteminfo',
    method: 'post',
    data: data
  })
}

// 修改订单对象信息
export function updateOrderiteminfo(data) {
  return request({
    url: '/system/orderiteminfo',
    method: 'put',
    data: data
  })
}

// 删除订单对象信息
export function delOrderiteminfo(ino) {
  return request({
    url: '/system/orderiteminfo/' + ino,
    method: 'delete'
  })
}
