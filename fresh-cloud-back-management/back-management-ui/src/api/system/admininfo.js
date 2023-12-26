import request from '@/utils/request'

// 查询管理员列表
export function listAdmininfo(query) {
  return request({
    url: '/system/admininfo/list',
    method: 'get',
    params: query
  })
}

// 查询管理员详细
export function getAdmininfo(aid) {
  return request({
    url: '/system/admininfo/' + aid,
    method: 'get'
  })
}

// 新增管理员
export function addAdmininfo(data) {
  return request({
    url: '/system/admininfo',
    method: 'post',
    data: data
  })
}

// 修改管理员
export function updateAdmininfo(data) {
  return request({
    url: '/system/admininfo',
    method: 'put',
    data: data
  })
}

// 删除管理员
export function delAdmininfo(aid) {
  return request({
    url: '/system/admininfo/' + aid,
    method: 'delete'
  })
}
