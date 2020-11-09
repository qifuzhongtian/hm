*** Settings ***
Suite Setup       绿道登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f    time=0    type=0
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
绿道_患者信息
    [Documentation]    :3022/patient/getPatientInfo
    ${getRes}   卒中绿道_患者信息   id=1     customEnv=1
    Should Contain  ${getRes['msg']}    success
