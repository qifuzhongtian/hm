*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String


*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
根据评估历史记录id查询评估记录
    ############评估历史#############
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=${time_now}    inpatientDepartment=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "1566805231782","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=440    assessName=手术患者深静脉血栓栓塞症风险评估表(Caprini评分表)    patientGuid=${timestamp}${random}    pageSource=2
    ...    serialNumber=${timestamp}${random}    assessValue=1分    assessResult=低危    historyItemList={"type":"checkbox","value":"hm_blood_vasc_7-HMID-hm_blood_vasc_8"}
    ...    source={"wordId":"319983","isSelected":0,"itemType":2},{"wordId":"319984","isSelected":0,"itemType":2},{"wordId":"16476","isSelected":0,"itemType":2},{"wordId":"10282","isSelected":0,"itemType":2},{"wordId":"319985","isSelected":0,"itemType":2},{"wordId":"319515","isSelected":0,"itemType":2},{"wordId":"311602","isSelected":0,"itemType":2},{"wordId":"311597","isSelected":0,"itemType":2},{"wordId":"311598","isSelected":0,"itemType":2},{"wordId":"319987","isSelected":1,"itemType":2},{"wordId":"4157","isSelected":1,"itemType":2},{"wordId":"311599","isSelected":0,"itemType":2},{"wordId":"311600","isSelected":0,"itemType":2},{"wordId":"319988","isSelected":0,"itemType":2},{"wordId":"319990","isSelected":0,"itemType":2},{"wordId":"311666","isSelected":0,"itemType":2},{"wordId":"319992","isSelected":0,"itemType":2},{"wordId":"319993","isSelected":0,"itemType":2},{"wordId":"319994","isSelected":0,"itemType":2},{"wordId":"319995","isSelected":0,"itemType":2},{"wordId":"86886","isSelected":0,"itemType":2},{"wordId":"319996","isSelected":0,"itemType":2},{"wordId":"311603","isSelected":0,"itemType":2},{"wordId":"311605","isSelected":0,"itemType":2},{"wordId":"132002","isSelected":0,"itemType":2},{"wordId":"319997","isSelected":0,"itemType":2},{"wordId":"319998","isSelected":0,"itemType":2},{"wordId":"319999","isSelected":0,"itemType":2},{"wordId":"320000","isSelected":0,"itemType":2},{"wordId":"320001","isSelected":0,"itemType":2},{"wordId":"311611","isSelected":0,"itemType":2},{"wordId":"121935","isSelected":0,"itemType":2},{"wordId":"311612","isSelected":0,"itemType":2},{"wordId":"320002","isSelected":0,"itemType":2},{"wordId":"311614","isSelected":0,"itemType":2},{"wordId":"320009","isSelected":0,"itemType":2},{"wordId":"320010","isSelected":0,"itemType":2},{"wordId":"311616","isSelected":0,"itemType":2},{"wordId":"320011","isSelected":0,"itemType":2}
    ...    resultContent=<div class=\"hm-eva-res-con\"id=\"hm_ev_ne_res\"style=\"display: block;\"><div class=\"hm-eva-cal-res\"><span class=\"hm-ev-u\"><span class=\"hm-t\">Caprini评分：</span><span id=\"hm_vet_total_cal\">1分 低危</span> </span><span style=\"float:right;font-size:12px\"><input type=\"checkbox\" id=\"no_back_event\"> 结论不回填至病历</span></div></div>
    ...    assessItemWordIds={"wordId":"319983","isSelected":0,"itemType":2},{"wordId":"319984","isSelected":0,"itemType":2},{"wordId":"16476","isSelected":0,"itemType":2},{"wordId":"10282","isSelected":0,"itemType":2},{"wordId":"319985","isSelected":0,"itemType":2},{"wordId":"319515","isSelected":0,"itemType":2},{"wordId":"311602","isSelected":0,"itemType":2},{"wordId":"311597","isSelected":0,"itemType":2},{"wordId":"311598","isSelected":0,"itemType":2},{"wordId":"319987","isSelected":1,"itemType":2},{"wordId":"4157","isSelected":1,"itemType":2},{"wordId":"311599","isSelected":0,"itemType":2},{"wordId":"311600","isSelected":0,"itemType":2},{"wordId":"319988","isSelected":0,"itemType":2},{"wordId":"319990","isSelected":0,"itemType":2},{"wordId":"311666","isSelected":0,"itemType":2},{"wordId":"319992","isSelected":0,"itemType":2},{"wordId":"319993","isSelected":0,"itemType":2},{"wordId":"319994","isSelected":0,"itemType":2},{"wordId":"319995","isSelected":0,"itemType":2},{"wordId":"86886","isSelected":0,"itemType":2},{"wordId":"319996","isSelected":0,"itemType":2},{"wordId":"311603","isSelected":0,"itemType":2},{"wordId":"311605","isSelected":0,"itemType":2},{"wordId":"132002","isSelected":0,"itemType":2},{"wordId":"319997","isSelected":0,"itemType":2},{"wordId":"319998","isSelected":0,"itemType":2},{"wordId":"319999","isSelected":0,"itemType":2},{"wordId":"320000","isSelected":0,"itemType":2},{"wordId":"320001","isSelected":0,"itemType":2},{"wordId":"311611","isSelected":0,"itemType":2},{"wordId":"121935","isSelected":0,"itemType":2},{"wordId":"311612","isSelected":0,"itemType":2},{"wordId":"320002","isSelected":0,"itemType":2},{"wordId":"311614","isSelected":0,"itemType":2},{"wordId":"320009","isSelected":0,"itemType":2},{"wordId":"320010","isSelected":0,"itemType":2},{"wordId":"311616","isSelected":0,"itemType":2},{"wordId":"320011","isSelected":0,"itemType":2}
    ...    assessRemark=
    ${getRes}    根据评估历史记录id查询评估记录    Id=${assessHistoryId}
    Should Be Equal As Strings    ${getRes['head']['error']}    0
