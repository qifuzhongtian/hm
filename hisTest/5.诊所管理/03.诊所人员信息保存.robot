*** Settings ***
Suite Setup    Run Keywords    登录接口
# ...    AND    诊所人员查询    page=1
...    AND    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary

*** Variables ***
@{first}        1000    2000

# 字段名	类型	是否必须	说明
# doctorId	Integer	否	没有新增
# doctorName	String	是	用户名
# password	String	是	密码
# realName	String	是	真实姓名
# gender	Integer	是	性别
# phone	String	是	手机号
# mail	String	否	邮箱地址
# laboratoryId	Integer	是	科室
# function	List	否	权限
# flag	Long	是	1启用，0禁用
# status	Long		0 未审核， 1审核通过，2  账号锁定，3 手机未激活, 4删除
# verification	Integer	是  	"0：无权核查    1： 核查病历
# 登录的三个接口，也会返回此信息"
# functionId	Long	否	权限ID
*** Test Cases ***

3.1 诊所人员信息新增
    [Documentation]    断言:"error=0"
    # ${secs}    Get Time    epoch
    # ${doctorName}    Catenate    SEPARATOR=    ${secs}    自动添加诊所账号
    ${getRes}    诊所人员信息保存    doctorId=null    doctorName=${catenate}
    ...    password=e3ceb5881a0a1fdaad01296d7554868d    gender=1    realName=接口自动保存    phone=13333333333    mail=yinbo@huimei.com
    ...    laboratoryId=1    function=    first=${first}    flag=1    status=3    verification=1    functionId=
    Should Be Equal As Strings    ${getRes['head']['error']}    0


# 3.2 诊所人员信息修改
#     [Documentation]    断言:"error=0"
#     ${getRes}    诊所人员信息保存    doctorId=${doctorId}    doctorName=rfSave
#     ...    password=e3ceb5881a0a1fdaad01296d7554868d    gender=1    realName=接口自动保存    phone=13333333333    mail=yinbo@huimei.com
#     ...    laboratoryId=1    function="first": ["900", "1000", "2000"]    first=    flag=1    status=3    verification=1    functionId=
#     Should Be Equal As Strings    ${getRes['head']['error']}    0


