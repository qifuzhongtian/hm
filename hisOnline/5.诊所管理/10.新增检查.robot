*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# examId  Integer 否   没有新增
# examName    String  是   检查名称
# examPrice   Double  是   检查价格
# examCost    Double  是   成本价
*** Test Cases ***
5.1 新增检查
    [Documentation]    断言:""
    ${getRes}    新增检查    examId=    examName=${catenate}检查治疗项
    ...    examCost=1    examPrice=222
    Should Be Equal As Strings    ${getRes['head']['error']}    0



