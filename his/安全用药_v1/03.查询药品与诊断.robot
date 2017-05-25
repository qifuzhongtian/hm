*** Settings ***
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# name String 是 名称


*** Test Cases ***
3.1查询药品与诊断
    [Documentation]    断言error:""
    # 查询药品与诊断    ['body']['diseaseList'][0]['id']    5048
    # ...    name=高血糖
    ${getRes}    查询药品与诊断    name=高血糖
    Should Be Equal As Strings    ${getRes['body']['diseaseList'][0]['id']}    5048

