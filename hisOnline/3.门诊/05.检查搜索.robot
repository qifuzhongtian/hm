*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
...    AND    新增检查    examId=    examName=${catenate}检查治疗项    examCost=1    examPrice=222

Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# examName	String	是	检查名称

*** Test Cases ***
5.1 检查搜索
    [Documentation]    断言:""
    # 检查搜索    ['body']['examList'][0]['examName']    血糖检查    examName=血糖
    ${getRes}    检查搜索    examName=检查
    Should Contain    ${getRes['body']['examList'][0]['examName']}    检查治疗项
