*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
Suite Teardown    Delete All Sessions
# ...    AND    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# laboratoryId	Integer	否

*** Test Cases ***
6.1 科室信息保存
    [Documentation]    断言:""
    # ${secs}    Get Time    epoch
    # ${laboratoryName}    Catenate    SEPARATOR=    ${secs}    接口写发科室名
    ${getRes}    科室信息保存    laboratoryId=    laboratoryName=${catenate}测试科室
    Should Be Equal As Strings    ${getRes['head']['error']}    0


