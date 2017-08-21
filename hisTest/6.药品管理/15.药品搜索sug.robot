*** Settings ***
Suite Setup       登录接口
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# drugName	String	否	药品名搜索
# dataSource	Integer	是	药品数据源  0：仅查诊所
# version	integer	否	前端请求序列号
*** Test Cases ***
15.1 药品搜索sug批次入库模块
    [Documentation]    断言:"返回的 manufacturer含有 吉林省健今药业有限责任公司 "
    ${getRes}    药品搜索sug批次入库模块    dataSource=    drugName=接口发药品    version=
    ${aj}    Evaluate    [aj['manufacturer'] for aj in $getRes['body']['drugList']]
    Should Contain    ${aj}    吉林省健今药业有限责任公司



