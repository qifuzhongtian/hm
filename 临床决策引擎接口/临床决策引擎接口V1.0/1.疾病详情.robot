*** Settings ***
Resource          ../惠每决策引擎接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
1.1疾病详情显示正常
    [Documentation]    断言error:"error=0"
    疾病详情    0    diseaseId=8457C0ACE01
    # ...    token=_IViu1OIJeEIbdDUn_xA1mRfViNiYuuz_1476931194
# '{u'error': 0}'
# '{u'error': 0}'


1.2疾病详情diseaseId输入错误,详情显示失败
    [Documentation]    断言errorMsg:"message=程序异常"
    疾病详情1    程序异常！    diseaseId=8457C0ACE01333


1.3疾病详情diseaseId输入错误,详情显示失败
    [Documentation]    断言errorMsg:"message=程序异常"
    疾病详情2    程序异常！    diseaseId=8457C0ACE01333


1.4疾病详情diseaseId输入错误,详情显示失败
    [Documentation]    断言errorMsg:"message=程序异常"
    疾病详情2    程序异常！    diseaseId=8457C0ACE01333


