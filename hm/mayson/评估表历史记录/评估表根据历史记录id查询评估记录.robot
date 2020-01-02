*** Settings ***
# Suite Setup       保存评估历史记录    recordId=424054    assessId=221    assessName=川崎病心脏移植治疗评估表    patientGuid=4361    serialNumber=7225    assessResult=可采取心脏移植治疗
# ...               assessConclusion=严重且不可逆的心功能不全建议进行心脏移植治疗    historyItemList={"type": "checkbox","value": "hm_blood_pesi_1-HMID-hm_subresult_ipt"}    source=<div><style>.hm-eva-pane-ne{font-family:\"Microsoft YaHei\";color:#666;font-size:14px;padding:10px 20px 10px 20px;margin-bottom:40px}.hm-eva-pane-ne .hm-eva-level-tit{color:#222;font-size:16px;padding:15px 0 5px 0;display:block}.hm-eva-pane-ne .hm-eva-level-unit{padding:5px 0;clear:both}.hm-eva-pane-ne .hm-eva-level-unit .hm-eva-vt-left{float:left;position:relative;width:50px;padding-left:20px;line-height:25px}.hm-eva-pane-ne .hm-check-rad-span{position:absolute;left:1px;top:5px;width:14px;height:14px;outline:0}.hm-eva-pane-ne .hm-check-rad{margin:0;height:14px;width:14px;padding:0;border:0;position:absolute;left:0;top:0;outline:0}.hm-eva-pane-ne label{outline:0}.hm-eva-pane-ne .hm-eva-level-unit .hm-eva-vt-right{margin-left:70px;line-height:25px}.hm-eva-pane-ne.hm-eva-res-con{position:absolute;bottom:0;padding-bottom:5px;left:0;width:100%;background:#fff;z-index:10}.hm-eva-pane-ne .hm-eva-cal-res{padding:5px 10px;border-radius:5px;background-color:#efebd9;line-height:22px;display:none;width:900px;margin-left:15px}.hm-eva-pane-ne .hm-eva-cal-res .hm-ev-u{padding-right:15px}.hm-eva-pane-ne .hm-eva-cal-res .hm-t{color:#000}.hm-eva-pane-ne .hm-check-rad-span{position:absolute;left:1px;top:5px;width:14px;height:14px;outline:0}.hm-eva-pane-ne#hm_eva_common_hct_12 .hm-eva-sl-ful,.hm-eva-pane-ne#hm_eva_common_hct_7 .hm-eva-sl-ful,.hm-eva-pane-ne#hm_eva_common_hct_8 .hm-eva-sl-ful,.hm-eva-pane-ne .hm-common-hct-c .hm-eva-sl-ful{margin:1px 0;padding-left:0}.hm-eva-pane-ne .hm-eva-level-co{width:100%;overflow:hidden;line-height:25px}.hm-eva-pane-ne .hm-eva-sl{width:100%;display:inline-block;position:relative;padding-left:20px}.hm-eva-pane-ne .hm-eva-sl.active{color:#4eaaf7}.hm-eva-pane-ne .hm-check-i{margin:0;height:14px;width:14px;padding:0;border:0;position:absolute;left:0;top:0;outline:0}.hm-eva-pane-ne .hm-eva-descript{background:#f0f3f4;padding:5px 10px}.hm-eva-pane-ne .hm-check-i-span{position:absolute;width:14px;height:14px;left:1px;top:5px;outline:0}.hm-eva-pane-ne .hm-eva-sl-ful{width:100%;display:inline-block;position:relative;padding-left:20px}.hm-eva-pane-ne .hm-eva-level-unit1{padding:5px 0;position:relative}.hm-eva-pane-ne .hm-eva-level-unit1 .hm-eva-vt-left{float:left;position:relative;width:50px;padding-left:20px;line-height:25px}.hm-eva-pane-ne .hm-eva-level-unit1 .hm-eva-vt-right{margin-left:70px;line-height:25px}.hm-ev-subU{padding-left:45px}.hm-ev-subU input{vertical-align:middle;position:relative;top:-1px}</style><div id=\"hm_eva_common_cont\" class=\"hm-eva-pane-ne\"><div id=\"hm_eva_common_medical\"><div class=\"hm-eva-level-tit\">满足以下任一条件者，即可采取心脏移植治疗</div><div id=\"hm_eva_common_cot\"><div id=\"hm_eva_common_v1\" class=\"hm-eva-level-co\"><span class=\"hm-eva-sl active\"><span name=\"hm_eva_kpl\" class=\"hm-check-rad-span\"><input id=\"hm_blood_pesi_1\" type=\"checkbox\" name=\"hm_eva_kpl\" class=\"hm-check-rad hm-check\" desc=\"严重且不可逆的心功能不全\"></span><label for=\"hm_blood_pesi_1\">严重且不可逆的心功能不全</label></span></div><div id=\"hm_eva_common_v2\" class=\"hm-eva-level-co\"><span class=\"hm-eva-sl\"><span name=\"hm_eva_kpl\" class=\"hm-check-rad-span\"><input id=\"hm_blood_pesi_2\" type=\"checkbox\" name=\"hm_eva_kpl\" class=\"hm-check-rad hm-check\" desc=\"介入及CABG不可行的冠状动脉病变者\"></span><label for=\"hm_blood_pesi_2\">介入及CABG不可行的冠状动脉病变者</label></span></div></div></div></div><script>!function(o){var i=\"\",l=\"\",m=\"\",a=!0,d=document.getElementById(\"hm_ev_ne_res\"),_=document.getElementById(\"hm_vet_total_sc\"),u=document.getElementById(\"hm_vet_total_cal\"),e=o.findByAttr(\"input[type=checkbox]\",\"hm_eva_common_cot\");function t(){m=l=i=\"\";var e=o.getCheckRadioChecked(\"hm_eva_common_medical\",\"input[type=checkbox][name=hm_eva_kpl]\"),t=\"\";if(1==a&&(o.setCheckedStyle(e,\"active\"),a=!1),e.length){for(var n=0;n<e.length;n++){var c=\"\";0<n&&(c=\"，\"),t+=c+e[n].getAttribute(\"desc\")}d.style.display=\"block\",i=t+\"建议进行心脏移植治疗\",l=m=\"可采取心脏移植治疗\",_.innerHTML=m,u.innerHTML=i}else d.style.display=\"none\",i=m=l=\"\"}o.bind(e,\"onclick\",function(){o.mangeCheckboxStyle(this,\"active\"),t()}),t(),window.getHmEvaReturn=function(){return document.getElementById(\"hm_subresult_ipt\").checked&&(l=i&&m+\":\"+i+\"。\"||m),{result:l,conclusion:m,description:i}}}(window.MaysonPublicPage)</script></div>    resultContent=<div class=\"hm-eva-res-con\"id=\"hm_ev_ne_res\" style=\"display: block;\"><div class=\"hm-eva-cal-res\"><div class=\"hm-ev-u\"><span class=\"hm-t\">结论：</span><span id=\"hm_vet_total_sc\">可采取心脏移植治疗</span></div><div class=\"hm-ev-u hm-ev-subU\"><input id=\"hm_subresult_ipt\" type=\"checkbox\" name=\"hm_subresult_ipt\" checked=\"checked\" class=\"hm_subresult_ipt\"><label for=\"hm_subresult_ipt\" class=\"subStr\">说明：</label><span id=\"hm_vet_total_cal\">严重且不可逆的心功能不全建议进行心脏移植治疗</span></div></div></div>    assessItemWordIds=    assessResultSource=2
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String    # 字段名 类型    是否必须    说明    # patientGuid String    是    患者编号
...               # recordId    Integer 是    病历id    # assessId    String    是    住院就诊编号
...               # customerId    String    是    customerId    # assessId    Integer 是    评估表id
...               # assessName    String    是    评估表名称    # assessResult    String    是
...               # 评估结果    # assessConclusion    String    是    解释    # source    String
...               # 是    页面数据源    # historyItemList List    是    评估历史明细集合    # ----type    String
...               # 否    评估类型    # ----value    Double    否    评估结果

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
根据评估历史记录id查询评估记录
    ############评估历史#############
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "1566805231782","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=${recordId}    assessId=440    assessName=手术患者深静脉血栓栓塞症风险评估表(Caprini评分表)    patientGuid=${timestamp}${random}    assessResultSource=2
    ...    serialNumber=${timestamp}${random}    assessResult=1分    assessConclusion=低危    historyItemList={"type":"checkbox","value":"hm_blood_vasc_7-HMID-hm_blood_vasc_8"}
    ...    source={"wordId":"319983","isSelected":0,"itemType":2},{"wordId":"319984","isSelected":0,"itemType":2},{"wordId":"16476","isSelected":0,"itemType":2},{"wordId":"10282","isSelected":0,"itemType":2},{"wordId":"319985","isSelected":0,"itemType":2},{"wordId":"319515","isSelected":0,"itemType":2},{"wordId":"311602","isSelected":0,"itemType":2},{"wordId":"311597","isSelected":0,"itemType":2},{"wordId":"311598","isSelected":0,"itemType":2},{"wordId":"319987","isSelected":1,"itemType":2},{"wordId":"4157","isSelected":1,"itemType":2},{"wordId":"311599","isSelected":0,"itemType":2},{"wordId":"311600","isSelected":0,"itemType":2},{"wordId":"319988","isSelected":0,"itemType":2},{"wordId":"319990","isSelected":0,"itemType":2},{"wordId":"311666","isSelected":0,"itemType":2},{"wordId":"319992","isSelected":0,"itemType":2},{"wordId":"319993","isSelected":0,"itemType":2},{"wordId":"319994","isSelected":0,"itemType":2},{"wordId":"319995","isSelected":0,"itemType":2},{"wordId":"86886","isSelected":0,"itemType":2},{"wordId":"319996","isSelected":0,"itemType":2},{"wordId":"311603","isSelected":0,"itemType":2},{"wordId":"311605","isSelected":0,"itemType":2},{"wordId":"132002","isSelected":0,"itemType":2},{"wordId":"319997","isSelected":0,"itemType":2},{"wordId":"319998","isSelected":0,"itemType":2},{"wordId":"319999","isSelected":0,"itemType":2},{"wordId":"320000","isSelected":0,"itemType":2},{"wordId":"320001","isSelected":0,"itemType":2},{"wordId":"311611","isSelected":0,"itemType":2},{"wordId":"121935","isSelected":0,"itemType":2},{"wordId":"311612","isSelected":0,"itemType":2},{"wordId":"320002","isSelected":0,"itemType":2},{"wordId":"311614","isSelected":0,"itemType":2},{"wordId":"320009","isSelected":0,"itemType":2},{"wordId":"320010","isSelected":0,"itemType":2},{"wordId":"311616","isSelected":0,"itemType":2},{"wordId":"320011","isSelected":0,"itemType":2}
    ...    resultContent=<div class=\"hm-eva-res-con\"id=\"hm_ev_ne_res\"style=\"display: block;\"><div class=\"hm-eva-cal-res\"><span class=\"hm-ev-u\"><span class=\"hm-t\">Caprini评分：</span><span id=\"hm_vet_total_cal\">1分 低危</span> </span><span style=\"float:right;font-size:12px\"><input type=\"checkbox\" id=\"no_back_event\"> 结论不回填至病历</span></div></div>
    ...    assessItemWordIds={"wordId":"319983","isSelected":0,"itemType":2},{"wordId":"319984","isSelected":0,"itemType":2},{"wordId":"16476","isSelected":0,"itemType":2},{"wordId":"10282","isSelected":0,"itemType":2},{"wordId":"319985","isSelected":0,"itemType":2},{"wordId":"319515","isSelected":0,"itemType":2},{"wordId":"311602","isSelected":0,"itemType":2},{"wordId":"311597","isSelected":0,"itemType":2},{"wordId":"311598","isSelected":0,"itemType":2},{"wordId":"319987","isSelected":1,"itemType":2},{"wordId":"4157","isSelected":1,"itemType":2},{"wordId":"311599","isSelected":0,"itemType":2},{"wordId":"311600","isSelected":0,"itemType":2},{"wordId":"319988","isSelected":0,"itemType":2},{"wordId":"319990","isSelected":0,"itemType":2},{"wordId":"311666","isSelected":0,"itemType":2},{"wordId":"319992","isSelected":0,"itemType":2},{"wordId":"319993","isSelected":0,"itemType":2},{"wordId":"319994","isSelected":0,"itemType":2},{"wordId":"319995","isSelected":0,"itemType":2},{"wordId":"86886","isSelected":0,"itemType":2},{"wordId":"319996","isSelected":0,"itemType":2},{"wordId":"311603","isSelected":0,"itemType":2},{"wordId":"311605","isSelected":0,"itemType":2},{"wordId":"132002","isSelected":0,"itemType":2},{"wordId":"319997","isSelected":0,"itemType":2},{"wordId":"319998","isSelected":0,"itemType":2},{"wordId":"319999","isSelected":0,"itemType":2},{"wordId":"320000","isSelected":0,"itemType":2},{"wordId":"320001","isSelected":0,"itemType":2},{"wordId":"311611","isSelected":0,"itemType":2},{"wordId":"121935","isSelected":0,"itemType":2},{"wordId":"311612","isSelected":0,"itemType":2},{"wordId":"320002","isSelected":0,"itemType":2},{"wordId":"311614","isSelected":0,"itemType":2},{"wordId":"320009","isSelected":0,"itemType":2},{"wordId":"320010","isSelected":0,"itemType":2},{"wordId":"311616","isSelected":0,"itemType":2},{"wordId":"320011","isSelected":0,"itemType":2}
    ${getRes}    根据评估历史记录id查询评估记录    Id=${assessHistoryId}
    Should Be Equal As Strings    ${getRes['head']['error']}    0
