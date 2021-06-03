*** Settings ***
Suite Setup       drg登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
drgs列表导出
    [Documentation]    doc/seer/document/download?filePath=http%3A%2F%2F120.26.223.139%2Fdocument-1524192044805.pdf&fileName=%E9%97%A8%E9%9D%99%E8%84%89%E7%B3%BB%E7%BB%9F%E8%A1%80%E6%A0%93%E5%BD%A2%E6%88%90%E5%AF%BC%E8%87%B4%E7%BC%BA%E8%A1%80%E6%80%A7%E8%82%A0%E7%97%85%E7%9A%84%E5%A4%96%E7%A7%91%E6%B2%BB%E7%96%97.pdf,断言:"响应码200"
    ${getRes}    drgs列表导出    param={"time_type":2,"time_start":"2021-06-02","time_end":"2021-06-02","department":"","situation":"","query_num":"","warn_id":"","mdc_no":"","drgs_no":"","dead_risk":"","inpatient_days":"","doctor_name":"","query_name":"","order":{"name":"display_id","sort":"asc"}}
    Should Be Equal As Strings    ${getRes.status_code}    200




