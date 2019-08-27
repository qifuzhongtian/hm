*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
快速确认
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    快速确认    aiResult={"assessId":439,"assessName":"内科住院患者静脉血栓栓塞症风险评估表(Padua评分表)","assessResult":"低危","assessResultItemList":[{"itemId":1,"itemName":"年龄≥70岁","score":"1","source":[],"wordId":132001}],"assessValue":"1","assessValueUnit":"分"}
    ...    assessId=439    assessItem=内科住院患者静脉血栓栓塞症风险评估表(Padua评分表)
    ...    assessPostil=患者入院24小时内应进行VTE初始风险评估
    ...    assessResultItemList={"aiChecked":1,"itemId":1,"itemName":"年龄≥70岁","score":"1","source":[],"wordId":132001}
    ...    compare=1    expressId=7903    fileName=Padua.html    ignore=0    productId=1024    projectId=1001
    ...    qcDiseaseDiagnosisList={"diseaseId":1001}    doctorGuid=1    pageSource=2    recordId=1870894    assessResultType=1
    Should Contain    ${getRes['body']}    保存评估历史成功!

