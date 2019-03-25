*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String    # 字段名 类型    是否必须    说明    # {    #    "name": "血",
...               #    "diseaseId": "",    #    "pageSize": 10,    #    "currentPage": 1    # }

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
最新文献
    ############评估历史#############
    ${getRes}    最新文献
    ${aj}    Evaluate    [aj for aj in $getRes['body']['searchDiagnose']]
    Should Contain    ${aj}    心肌病
    # Should Be Equal As Strings    ${getRes['head']['error']}    0
