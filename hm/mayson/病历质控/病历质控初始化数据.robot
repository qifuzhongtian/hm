*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
病历质控初始化数据
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    病历质控初始化数据    patientGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    doctorGuid=1001    pageSource=${1}
    Should Contain    ${getRes['body']}    患者基本信息测试数据初始化成功



