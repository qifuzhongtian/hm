*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# manufacturer	String	是	生产厂家名称
# version	integer	否	前端请求序列号

*** Test Cases ***
5.1 生产厂家sug
    [Documentation]    断言:"cnManufacturer=北大国际医院集团西南合成制药股份有限公司"
    ${getRes}    生产厂家sug    manufacturer=北大   version=39
    Should Be Equal As Strings    ${getRes['body']['manufacturerList'][0]['cnManufacturer']}    北大国际医院集团西南合成制药股份有限公司


