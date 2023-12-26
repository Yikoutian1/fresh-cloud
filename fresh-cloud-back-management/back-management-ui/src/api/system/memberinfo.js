import request from '@/utils/request'

// 查询会员列表
export function listMemberinfo(query) {
  return request({
    url: '/system/memberinfo/list',
    method: 'get',
    params: query
  })
}

// 查询会员详细
export function getMemberinfo(mno) {
  return request({
    url: '/system/memberinfo/' + mno,
    method: 'get'
  })
}

// 新增会员
export function addMemberinfo(data) {
  return request({
    url: '/system/memberinfo',
    method: 'post',
    data: data
  })
}

// 修改会员
export function updateMemberinfo(data) {
  return request({
    url: '/system/memberinfo',
    method: 'put',
    data: data
  })
}

// 删除会员
export function delMemberinfo(mno) {
  return request({
    url: '/system/memberinfo/' + mno,
    method: 'delete'
  })
}
