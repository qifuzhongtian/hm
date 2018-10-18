*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
...    AND    科室信息保存    laboratoryId=    laboratoryName=${catenate}测试科室
...    AND    科室信息查询    page=1
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# laboratoryId	Integer	否

*** Test Cases ***
5.1 科室信息删除
    [Documentation]    断言:""
    ${getRes}    科室信息删除    laboratoryId=${laboratoryId}
    Should Be Equal As Strings    ${getRes['head']['error']}    0


