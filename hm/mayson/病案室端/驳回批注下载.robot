*** Settings ***
Suite Setup       病历质控平台登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime


*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
驳回批注下载
    [Documentation]    http://172.16.3.40:3021/mc/mcRecordInfoDownload,断言:"响应码200"
    ${getRes}    驳回批注下载    param={"order":{"name":"discharge_time","sort":"desc"},"time_start":"2019-02-04","time_end":"2019-08-03","inpatient_department":"","display_id":"","patient_name":"","doctor_name":"","problem_start":"0","problem_end":1000,"status":"","index_start":"0","index_end":"100","total_start":"0","total_end":"100"}    filePath=${doc_online}/document-1524192044805.pdf
    Should Be Equal As Strings    ${getRes.status_code}    200

