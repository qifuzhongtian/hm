*** Variables ***
#mayson生产环境
#${mayson_url}     http://profile-mayson.huimeionline.com/cdss
#${mayson_url}     http://test-profile.huimeionline.com/cdss

#fuxi验证接口
${fuxi_data}       http://fuxi.huimeionline.com/node/active/

#adminse
${adminse}       http://admin-se.huimeionline.com/

#huimeiid
${Huimei_id}        7195F12825788F09375C2DB1E922F108




*** Keywords ***
# 获取时间戳
#     ${timestamp}    Get Time    epoch
#     Set Global Variable    ${timestamp}

# 获取随机数
#     ${random}    Generate Random String    3    1234567890
#     Set Global Variable    ${random}
    ################安全用药################

登录
    [Arguments]    ${name}    ${password}

    ${dict}    Create Dictionary    Content-Type=application/json
    Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}


新版质控统计明细
    [Arguments]    ${id}

    #${dict}    Create Dictionary    Content-Type=application/json
    #Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    queryChartConfig    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}



新版质控统计
    [Arguments]    ${id}

    #${dict}    Create Dictionary    Content-Type=application/json
    #Create Session    api    ${fuxi_data}    ${dict}
    ${data}    Create Dictionary    id=${id}
    ${addr}    Post Request    api    queryChartConfig    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}




adminse登录
    [Arguments]    ${name}    ${password}

    ${dict}    Create Dictionary    Content-Type=application/json
    Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    name=${name}    password=${password}
    ${addr}    Post Request    api    node/user/login    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}




下发规则
    [Arguments]    ${customerId}

    ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    customerId=${customerId}
    ${addr}    Post Request    api    cdss/mayson/effectTemplate    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}



规则模板配置
    [Arguments]    ${index}    ${pageSize}    ${customerId}    ${systemId}    ${progressType}    ${templateName}    ${modifyDateBegin}    ${modifyDateEnd}

    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    index=${index}    pageSize=${pageSize}    customerId=${customerId}    systemId=${systemId}    progressType=${progressType}    templateName=${templateName}    modifyDateBegin=${modifyDateBegin}    modifyDateEnd=${modifyDateEnd}
    ${addr}    Post Request    api    node/msParser/getMsParserList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}




检查检验查看
    [Arguments]    ${customerId}    ${index}    ${pageSize}    ${orderBy}    ${sourceType}

    # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
    # Create Session    api    ${adminse}    ${dict}
    ${data}    Create Dictionary    customerId=${customerId}    index=${index}    pageSize=${pageSize}    orderBy=${orderBy}    sourceType=${sourceType}
    ${addr}    Post Request    api    node/dictionary/queryExamCustomerList    data=${data}
    ${responsedata}    To Json    ${addr.content}
    # ${str}    Get From Dictionary    ${responsedata}    head
    # ${str1}    Get From Dictionary    ${str}    error
    # Should Be Equal As Strings    ${str1}    ${msg}
    # Should Be Equal As Strings    ${responsedata['body']['interactionList'][0]['grade']}    ${msg}
    # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
    [Return]    ${responsedata}






