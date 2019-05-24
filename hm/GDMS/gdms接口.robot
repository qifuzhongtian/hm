*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
gdms首页
    ${dict}    Create Dictionary    Content-Type=text/html    Huimei_id=${Huimei_id}
    Create Session    api    ${base_gdms}    ${dict}
    ${addr}    Get Request    api    ?auther_key=7195F12825788F09375C2DB1E922F108&serial_number=1507520888&patient_guid=1507520341
    log    ${addr}
    log    ${addr.status_code}
    Should Be Equal As Strings    ${addr.status_code}    200
