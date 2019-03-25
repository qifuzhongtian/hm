*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    诊所人员信息保存    doctorId=null    doctorName=${catenate}    password=e3ceb5881a0a1fdaad01296d7554868d    gender=1    realName=接口自动保存    phone=13333333333    mail=yinbo@huimei.com    laboratoryId=1    function=    first=${first}    flag=1    status=3    verification=1    functionId=
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# doctorId	Integer	否

*** Variables ***
@{first}        1000    2000

*** Test Cases ***
2.1 诊所人员信息删除
    [Documentation]    断言:"patientName=患者1"
    # ${secs}    Get Time    epoch
    # ${doctorName}    Catenate    SEPARATOR=    ${secs}    自动添加诊所账号
    ${getRes}    诊所人员信息删除    doctorId=${doctorId}
    Should Be Equal As Strings    ${getRes['head']['error']}    0


# 2.2 诊所人员信息删除
#     [Documentation]    断言:"error=0"
#     ${getRes}    诊所人员信息删除    doctorId=234324
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

