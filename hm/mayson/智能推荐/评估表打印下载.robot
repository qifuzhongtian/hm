*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
评估表打印下载
    [Documentation]    断言:"响应码200"
    ${getRes}    评估表打印下载
    ...    pdfName=内科出血风险评.pdf    pdfPath=${mayson_url}/1581924339449.pdf
    Should Be Equal As Strings    ${getRes.status_code}    200




