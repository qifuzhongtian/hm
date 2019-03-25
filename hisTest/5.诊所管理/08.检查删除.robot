*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    检查查询    examName=${empty}    page=1
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary


*** Test Cases ***
5.1 检查删除
    [Documentation]    断言:""
    ${getRes}    检查删除    examId=${examId}
    Should Be Equal As Strings    ${getRes['head']['error']}    0



