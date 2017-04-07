*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
1.1梅奥疾病详情
    [Documentation]    断言error:"error=0"
    梅奥疾病详情    0    diseaseId=8457C0ACE01
    # ...    token=_IViu1OIJeEIbdDUn_xA1mRfViNiYuuz_1476931194
# '{u'error': 0}'
# '{u'error': 0}'


1.2梅奥疾病详情diseaseId输入错误,详情显示失败
    [Documentation]    断言errorMsg:"error=500"
    梅奥疾病详情    500    diseaseId=8457C0ACE01333


1.3梅奥疾病详情diseaseId输入错误,详情显示失败
    [Documentation]    断言errorMsg:"error=500"
    梅奥疾病详情    500    diseaseId=8457C0ACE01333


1.4梅奥疾病详情diseaseId输入错误,详情显示失败
    [Documentation]    断言errorMsg:"error=500"
    梅奥疾病详情    500    diseaseId=8457C0ACE01333
