*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型 是否必须 说明    # gender Integer 是 1男，0女

*** Test Cases ***
3.1常见个人史
    [Documentation]    断言:"historyType"
    # 3.1常见个人史
    #    [Documentation]    断言:"historyType"
    #    常见个人史    ['body']['personalHistoryList'][0]['historyType']    用药史    gender=1
    # 3.2常见个人史,gender错误显示失败
    #    [Documentation]    断言:"message=你输入的错误！请检查你的输入格式！"
    #    常见个人史    ['head']['message']    你输入的错误！请检查你的输入格式！    gender=啊啊啊啊
    常见个人史1    ['body']['personalHistoryList'][0]['historyType']    用药史    gender=1

常见个人史1
    常见个人史1
    Should Be Equal As Strings    ${responsedata['body']['personalHistoryList'][0]['historyType']}    用药史
    Delete All Sessions
