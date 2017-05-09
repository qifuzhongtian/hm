*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
2.1常见诊断
    [Documentation]    断言:"id"
    常见诊断    ['body']['commonDiseases'][0]['id']    34051


