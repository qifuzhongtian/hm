*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    科室信息保存    laboratoryId=    laboratoryName=${catenate}测试科室
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# page	Integer	否	当前页数

*** Variables ***
@{first}        1000    2000

*** Test Cases ***
7.1 科室信息查询
    [Documentation]    断言:""
    ${getRes}    科室信息查询    page=1
    # ${aj}    Evaluate    [aj['laboratoryName'] for aj in $getRes['body']['laboratoryList']]
    # Should Contain    ${aj}    接口发科室名称
    # Should Be Equal As Strings    ${getRes['body']['laboratoryList'][1]['laboratoryName']}    接口发科室名称
    Should Contain    ${getRes['body']['laboratoryList'][0]['laboratoryName']}    接口发测试科室


