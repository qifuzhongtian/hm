*** Settings ***
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型 是否必须 说明
# userNameString是用户名
# password String 是 密码
# realName String 是 真实姓名
# phone String 是 手机号
# registerInvitation String 否 注册码正确账号直接激活状态
# hospitalName String 是 机构名称
# hospitalLicense String 是 营业执照  最多三张 #HM# 分割
# smsCaptcha String 是 验证码
# invitationCode String 否 邀请码


*** Test Cases ***
1.1诊所注册,填写药品id,通过
    [Documentation]    断言error:""
    诊所注册    0    userName=testyin    realName=测试账号
    ...    phone=13810578454    registerInvitation=    hospitalName=测试机构
    ...    hospitalLicense=1111    smsCaptcha=222222    invitationCode=



