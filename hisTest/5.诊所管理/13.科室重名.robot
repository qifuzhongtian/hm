*** Settings ***
Suite Setup    登录接口
# ...    AND    获取时间戳
# ...    AND    科室信息保存    laboratoryId=    laboratoryName=${catenate}测试科室

Suite Teardown    Delete All Sessions
# ...    AND    获取时间戳

Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# laboratoryName	Integer	否

*** Test Cases ***
13.1 科室重名,不存在的科室
    [Documentation]    断言:"result=0"
    ${getRes}    科室重名    laboratoryName=测试科室
    Should Be Equal As Strings    ${getRes['body']['result']}    1


# 13.2 科室重名,存在的科室
#     [Documentation]    断言:"result=1"
#     ${getRes}    科室重名    laboratoryName=呵呵呵呵
#     Should Be Equal As Strings    ${getRes['body']['result']}    0

