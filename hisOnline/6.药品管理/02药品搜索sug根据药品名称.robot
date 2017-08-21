*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# drugName    String  否   药品名搜索
# dataSource    int 否   "药品分类:  枚举值饮片：1中成药：2化学制剂：3耗材:4生物制品:5"
# version  int 是   状态 1：启用 2：禁用
# currentPage int 是   当前页数
# pageSize    int 否   分页数量大小
*** Test Cases ***
2.1 药品搜索sug根据药品名称
    [Documentation]    断言:"drugName"
    ${getRes}    药品搜索sug根据药品名称    drugName=安乐片    dataSource=1   version=
    Should Be Equal As Strings    ${getRes['body']['drugList'][0]['drugName']}    安乐片


