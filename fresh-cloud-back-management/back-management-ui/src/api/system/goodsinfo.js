import request from '@/utils/request'

// 查询商品信息列表
export function listGoodsinfo(query) {
  return request({
    url: '/system/goodsinfo/list',
    method: 'get',
    params: query
  })
}

// 查询商品信息详细
export function getGoodsinfo(gno) {
  return request({
    url: '/system/goodsinfo/' + gno,
    method: 'get'
  })
}

// 新增商品信息
export function addGoodsinfo(data) {
  return request({
    url: '/system/goodsinfo',
    method: 'post',
    data: data
  })
}

// 修改商品信息
export function updateGoodsinfo(data) {
  return request({
    url: '/system/goodsinfo',
    method: 'put',
    data: data
  })
}

// 删除商品信息
export function delGoodsinfo(gno) {
  return request({
    url: '/system/goodsinfo/' + gno,
    method: 'delete'
  })
}
