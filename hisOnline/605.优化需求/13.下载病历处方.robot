*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary    # 字段名    类型    说明    # recordId    Long    病历编号

*** Test Cases ***
13.1 下载病历处方
    [Documentation]    断言:"断言响应码200"
    ${getRes}    下载病历处方    recordId=62750
    log    ${getRes.status_code}
    Should Be Equal As Strings    ${getRes.status_code}    200

    # 导入药品excel
    #    [Arguments]    ${hospitalId}    ${excelFile}
    #    ${file}    Evaluate    open(/Users/yinbo/Downloads/drug_import_template_with_branch.xls)
    #    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    #    # Create Session    api    ${base_url}    ${dict}
    #    ${params}    Create Dictionary    hospitalId=${hospitalId}
    #    ${addr}    Get Request    api    his/instock/importDrugs    params=${params}    excelFile=${multiple_files}
    #    ${responsedata}    To Json    ${addr.content}
    #    # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
    #    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    #    # Delete All Sessions
    #    [Return]    ${responsedata}
    # *** Settings ***
    # Suite Setup    登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
    # Suite Teardown    RequestsLibrary.Delete All Sessions
    # Resource    ../his关键字.robot
    # Library    Collections
    # Library    RequestsLibrary    # 字段名    类型    # barCode    String    # 6924962599294

