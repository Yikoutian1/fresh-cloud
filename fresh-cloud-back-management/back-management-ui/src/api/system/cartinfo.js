import request from '@/utils/request'

// 查询购物车信息列表
export function listCartinfo(query) {
  return request({
    url: '/system/cartinfo/list',
    method: 'get',
    params: query
  })
}

// 查询购物车信息详细
export function getCartinfo(cno) {
  return request({
    url: '/system/cartinfo/' + cno,
    method: 'get'
  })
}

// 新增购物车信息
export function addCartinfo(data) {
  return request({
    url: '/system/cartinfo',
    method: 'post',
    data: data
  })
}

// 修改购物车信息
export function updateCartinfo(data) {
  return request({
    url: '/system/cartinfo',
    method: 'put',
    data: data
  })
}

// 删除购物车信息
export function delCartinfo(cno) {
  return request({
    url: '/system/cartinfo/' + cno,
    method: 'delete'
  })
}
