import request from '@/utils/request'

// 查询商品类型列表
export function listGoodstype(query) {
  return request({
    url: '/system/goodstype/list',
    method: 'get',
    params: query
  })
}

// 查询商品类型详细
export function getGoodstype(tno) {
  return request({
    url: '/system/goodstype/' + tno,
    method: 'get'
  })
}

// 新增商品类型
export function addGoodstype(data) {
  return request({
    url: '/system/goodstype',
    method: 'post',
    data: data
  })
}

// 修改商品类型
export function updateGoodstype(data) {
  return request({
    url: '/system/goodstype',
    method: 'put',
    data: data
  })
}

// 删除商品类型
export function delGoodstype(tno) {
  return request({
    url: '/system/goodstype/' + tno,
    method: 'delete'
  })
}
