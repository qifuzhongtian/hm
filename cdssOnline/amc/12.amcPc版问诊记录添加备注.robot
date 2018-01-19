*** Settings ***
Suite Setup    Run Keywords    amc进入    AlgoID=2960    age=44    ageStyle=岁    gender=88    symptomId=12    symptomName=体重问题（指南）    patientName=接口发    patientPhone=13810578454
...    AND    amc下一题    questionId=${292}    type=option     answer=1
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型  说明
# 字段名	类型	是否必填	说明
# id	Integer	是	问诊记录id
# recordRemark	String	  是	备注

*** Variables ***

*** Test Cases ***
5.1 问诊记录添加备注
   # [Documentation]    断言:"error=0 成功"
    ${getRes}    问诊记录添加备注    number=${number}    recordRemark=接口加备注
    Should Be Equal As Strings    ${getRes['head']['error']}    0

