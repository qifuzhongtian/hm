*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***

文献下载
    [Documentation]    断言:"响应码200"
    ${getRes}   文献下载    fileName=门静脉系统血栓形成导致缺血性肠病的外科治疗.pdf    filePath=http://admin-document.oss-cn-hangzhou.aliyuncs.com/document-1524192044805.pdf
    Should Be Equal As Strings    ${getRes.status_code}    200

