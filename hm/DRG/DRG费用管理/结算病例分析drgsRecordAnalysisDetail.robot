*** Settings ***
Suite Setup       drg登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
结算病例分析drgsRecordAnalysisDetail
    [Documentation]    :3027/drgs/drgsRecordAnalysisDetail
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    结算病例分析drgsRecordAnalysisDetail    record_id=12448393333
    Should Contain    ${getRes['msg']}    success

