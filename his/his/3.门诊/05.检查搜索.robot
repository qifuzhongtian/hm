*** Settings ***
Suite Setup       登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# examName	String	是	检查名称

*** Test Cases ***
5.1 检查搜索
    [Documentation]    断言:""
    检查搜索    ['body']['examList'][0]['examName']    血糖检查    examName=血糖
