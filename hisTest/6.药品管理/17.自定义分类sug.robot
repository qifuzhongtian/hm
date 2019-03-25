*** Settings ***
Suite Setup       登录接口
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# customType   String  否   入库日期开始日期
# endDate String  否   入库日期结束日期
# batchNo String  否   批次号
# drugName    String  否   药品检索
# supplier    String  否   供货商

*** Test Cases ***
17.1 自定义分类sug
    [Documentation]    断言:"返回的 drugName含有 小儿盐酸异
    ${getRes}    自定义分类sug    customType=
    Should Be Equal As Strings    ${getRes['body']['typeList'][0]}    自定义分类
    # ${aj}    Evaluate    [aj['typeList'] for aj in $getRes['body']]
    # Should Contain    ${aj}    自定义分类项


