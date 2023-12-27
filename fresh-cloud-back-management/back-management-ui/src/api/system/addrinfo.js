import request from '@/utils/request'

// 查询地址信息列表
export function listAddrinfo(query) {
  return request({
    url: '/system/addrinfo/list',
    method: 'get',
    params: query
  })
}

// 查询地址信息详细
export function getAddrinfo(ano) {
  return request({
    url: '/system/addrinfo/' + ano,
    method: 'get'
  })
}

// 新增地址信息
export function addAddrinfo(data) {
  return request({
    url: '/system/addrinfo',
    method: 'post',
    data: data
  })
}

// 修改地址信息
export function updateAddrinfo(data) {
  return request({
    url: '/system/addrinfo',
    method: 'put',
    data: data
  })
}

// 删除地址信息
export function delAddrinfo(ano) {
  return request({
    url: '/system/addrinfo/' + ano,
    method: 'delete'
  })
}
