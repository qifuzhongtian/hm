*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
文献下载
    [Documentation]    断言:"响应码200"
    ${getRes}    文献下载    fileName=门静脉系统血栓形成导致缺血性肠病的外科治疗.pdf    filePath=${doc_online}/document-1524192044805.pdf
    Should Be Equal As Strings    ${getRes.status_code}    200
