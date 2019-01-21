*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名 类型 是否必须 说明    # gender Integer 是 1男，0女
Suite Teardown    Delete All Sessions

*** Test Cases ***
3.1常见个人史
    [Documentation]
    ${getRes}    常见个人史    gender=1
    Should Be Equal As Strings    ${getRes['body']['personalHistoryList'][0]['historyType']}    用药史
    # test
    #    随机字符    arg1value
    # test2
    #    ${getArg1}    随机字符-1    a1    b1    c1
    # test3
    #    ${getArg2}    随机字符-1    arg1value111


# 3.2常见个人史,gender错误显示失败
#     [Documentation]    断言:"message=你输入的错误！请检查你的输入格式！"
#     ${getRes}    常见个人史    gender=啊啊啊啊
#     Should Be Equal As Strings    ${getRes['head']['message']}    你输入的错误！请检查你的输入格式！
#     # 常见个人史    ['head']['message']    你输入的错误！请检查你的输入格式！    gender=啊啊啊啊
