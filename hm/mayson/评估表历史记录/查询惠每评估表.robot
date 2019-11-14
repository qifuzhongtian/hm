*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***
# 1566805231782    Get Time    epoch

*** Test Cases ***
查询惠每评估表
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐v2    userGuid=1566805231782    serialNumber=1566805231782    patientName=tester    pageSource=2    requestSource=    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":""},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ...    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "1566805231782","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ...    AND    保存评估历史记录    recordId=424054    assessId=440    assessName=手术患者深静脉血栓栓塞症风险评估表(Caprini评分表)    patientGuid=1566805231782    assessResultSource=2
    ...    serialNumber=1566805231782    assessResult=1分    assessConclusion=低危    historyItemList={"type":"checkbox","value":"hm_blood_vasc_2"}    source=<div><style>.hm-eva-pane-ne{font-family:\"Microsoft YaHei\";color:#666;font-size:14px;padding:10px 20px 10px 20px}.hm-eva-pane-ne .hm-eva-level-tit{color:#222;font-size:16px;padding:5px 0 5px 0;display:block;font-weight:400;margin:0;border-top:1px solid#b3b3b3;border-bottom:1px solid#b3b3b3}.hm-eva-pane-ne .hm-eva-level-unit{padding:5px 0;clear:both}.hm-eva-pane-ne .hm-eva-level-unit .hm-eva-vt-left{float:left;position:relative;width:50px;padding-left:20px;line-height:25px}.hm-eva-pane-ne .hm-check-rad-span{position:absolute;left:1px;top:5px;width:14px;height:14px;outline:0}.hm-eva-pane-ne .hm-check-rad{margin:0;height:14px;width:14px;padding:0;border:0;position:absolute;left:0;top:0;outline:0}.hm-eva-pane-ne label{outline:0}.hm-eva-pane-ne .hm-eva-level-unit .hm-eva-vt-right{margin-left:70px;line-height:25px}.hm-eva-pane-ne .hm-eva-res-con{position:absolute;bottom:0;padding-bottom:5px;left:0;width:100%;background:#fff;z-index:10}.hm-eva-pane-ne .hm-eva-cal-res{padding:5px 10px;border-radius:5px;background-color:#efebd9;line-height:22px;display:none;width:900px;margin-left:15px}.hm-eva-pane-ne .hm-eva-cal-res .hm-ev-u{padding-right:15px}.hm-eva-pane-ne .hm-eva-cal-res .hm-t{color:#000}.hm-eva-pane-ne .hm-check-rad-span{position:absolute;left:1px;top:5px;width:14px;height:14px;outline:0}.hm-eva-pane-ne#hm_eva_common_hct_12 .hm-eva-sl-ful,.hm-eva-pane-ne#hm_eva_common_hct_7 .hm-eva-sl-ful,.hm-eva-pane-ne#hm_eva_common_hct_8 .hm-eva-sl-ful,.hm-eva-pane-ne .hm-common-hct-c .hm-eva-sl-ful{margin:1px 0;padding-left:0}.hm-eva-pane-ne .hm-eva-level-co{width:100%;overflow:hidden;line-height:25px}.hm-eva-pane-ne .hm-eva-sl{width:260px;display:inline-block;position:relative;padding-left:20px}.hm-eva-pane-ne .hm-check-i{margin:0;height:14px;width:14px;padding:0;border:0;position:absolute;left:0;top:0;outline:0}.hm-eva-pane-ne .hm-eva-descript{background:#f0f3f4;padding:5px 10px}.hm-eva-pane-ne .hm-check-i-span{position:absolute;width:14px;height:14px;left:1px;top:5px;outline:0}.hm-eva-pane-ne .hm-eva-sl-ful{width:100%;display:inline-block;position:relative;padding-left:20px}.hm-eva-pane-ne .hm-eva-sl-ful.active{color:#4eaaf7}.hm-eva-pane-ne .hm-eva-level-unit1{padding:5px 0;position:relative}.hm-eva-pane-ne .hm-eva-level-unit1 .hm-eva-vt-left{float:left;position:relative;width:50px;padding-left:20px;line-height:25px}.hm-eva-pane-ne .hm-eva-level-unit1 .hm-eva-vt-right{margin-left:70px;line-height:25px}</style><div id=\"hm_eva_common_cont\" class=\"hm-eva-pane-ne\"><div id=\"hm_eva_common_medical\"><div class=\"hm-eva-level-co\"><p>年龄：22岁(<font id=\"hm_age_patientx\">0</font>分)&nbsp;&nbsp;&nbsp;性别：男 </p><h3 class=\"hm-eva-level-tit\">A1:每项危险因素1分</h3><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311666\" id=\"hm_blood_vasc_1\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_1\">小手术（1分）</label> </span><span class=\"hm-eva-sl-ful active\"><span class=\"hm-check-i-span\"><input name=\"311596\" id=\"hm_blood_vasc_2\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_2\">体质指数（BMI）&gt; 25kg/m²）（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"16476\" id=\"hm_blood_vasc_3\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_3\">下肢肿胀（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"10282\" id=\"hm_blood_vasc_4\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_4\">静脉曲张（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311597\" id=\"hm_blood_vasc_5\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_5\">脓毒症（＜1个月）（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311598\" id=\"hm_blood_vasc_6\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_6\">严重肺病，包括肺炎（＜1个月）（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"97599\" id=\"hm_blood_vasc_7\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_7\">肺功能异常（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"4157\" id=\"hm_blood_vasc_8\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_8\">急性心肌梗死（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311599\" id=\"hm_blood_vasc_9\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_9\">充血性心力衰竭（＜1个月）（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311600\" id=\"hm_blood_vasc_10\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_10\">炎性肠病史（1分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"10692\" id=\"hm_blood_vasc_11\" score=\"1\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_11\">卧床休息的患者（1分）</label> </span> <h3 class=\"hm-eva-level-tit\">B:每项危险因素2分</h3><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311603\" id=\"hm_blood_vasc_15\" score=\"2\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_15\">关节镜手术（2分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311604\" id=\"hm_blood_vasc_16\" score=\"2\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_16\">大型开放手术（2分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311605\" id=\"hm_blood_vasc_17\" score=\"2\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_17\">腹腔镜手术（＞45min）（2分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311595\" id=\"hm_blood_vasc_18\" score=\"2\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_18\">恶性肿瘤（2分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"127270\" id=\"hm_blood_vasc_19\" score=\"2\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_19\">卧床（＞72h）（2分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"310906\" id=\"hm_blood_vasc_20\" score=\"2\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_20\">石膏固定（2分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311606\" id=\"hm_blood_vasc_21\" score=\"2\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_21\">中央静脉通路（2分）</label></span><h3 class=\"hm-eva-level-tit\">C:每项危险因素3分</h3><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"312666\" id=\"hm_blood_vasc_22\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_22\">VTE史（3分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"312667\" id=\"hm_blood_vasc_23\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_23\">VTE家族史（3分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311609\" id=\"hm_blood_vasc_24\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_24\">凝血因子 V Leiden 突变（3分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311610\" id=\"hm_blood_vasc_25\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_25\">凝血酶原 G20210A 突变（3分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311611\" id=\"hm_blood_vasc_26\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_26\">狼疮抗凝物阳性（3分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311612\" id=\"hm_blood_vasc_27\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_27\">抗心磷脂抗体阳性（3分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311613\" id=\"hm_blood_vasc_28\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_28\">血清同型半肮氨酸升高（3分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"119840\" id=\"hm_blood_vasc_29\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_29\">肝素诱导的血小板减少症（3分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"149304\" id=\"hm_blood_vasc_30\" score=\"3\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_30\">其他先天性或获得性血栓形成倾向（3分）</label></span><h3 class=\"hm-eva-level-tit\">D:每项危险因素5分</h3><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311614\" id=\"hm_blood_vasc_31\" score=\"5\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_31\">脑卒中（ &lt;1 个月）（5分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311615\" id=\"hm_blood_vasc_32\" score=\"5\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_32\">择期关节置换术（5分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311616\" id=\"hm_blood_vasc_33\" score=\"5\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_33\">髋、骨盆或下肢骨折（5分）</label> </span><span class=\"hm-eva-sl-ful\"><span class=\"hm-check-i-span\"><input name=\"311617\" id=\"hm_blood_vasc_34\" score=\"5\" type=\"checkbox\" class=\"hm-check-i\"> </span><label for=\"hm_blood_vasc_34\">急性脊髓损伤（ &lt;1 个月）（5分）</label></span></div></div></div><script>!function(n){var c=\"\",o=\"\",i=\"\",m=\"\",a=!0,e=n.findByAttr(\"input\",\"hm_eva_common_medical\"),t=n.getAgeValue(\"22\",\"岁\")/365,d=0;function _(){var e=n.getCheckRadioChecked(\"hm_eva_common_medical\",\"input[type=checkbox]\"),t=n.getItemScore(\"hm_eva_common_medical\",\"checkbox\");document.getElementById(\"hm_ev_ne_res\").style.display=\"block\",t+=d,1==a&&(e.length&&n.setCheckedStyle(e,\"active\"),a=!1),0<=t&&t<=2?o=\"低危\":3<=t&&t<=4?o=\"中危\":5<=t&&(o=\"高危\"),document.getElementById(\"hm_vet_total_cal\").innerHTML=t+\"分 \"+o,c=\"Caprini评分：\"+t+\"分 \"+o,i=t+\"分\",m=o}t<41?d=0:41<=t&&t<=60?d=1:61<=t&&t<=74?d=2:75<=t&&(d=3),document.getElementById(\"hm_age_patientx\").innerHTML=d,n.bind(e,\"onclick\",function(){n.getCheckRadioChecked(\"hm_eva_common_medical\",\"input[type=checkbox]\");n.mangeCheckboxStyle(this,\"active\"),_()}),_(),window.getHmEvaReturn=function(){return{isNoBack:document.getElementById(\"no_back_event\").checked,result:c,conclusion:i,description:m,assessItemWordIds:n.getHmEvaCheckboxsStatus(e)}},\"undefined\"==typeof isFromHistory&&n.requestCheckboxStatus(e,\"440\",_)}(window.MaysonPublicPage)</script></div>    resultContent=<div class=\"hm-eva-res-con\"id=\"hm_ev_ne_res\"style=\"display: block;\"><div class=\"hm-eva-cal-res\"><span class=\"hm-ev-u\"><span class=\"hm-t\">Caprini评分：</span><span id=\"hm_vet_total_cal\">1分 低危</span> </span><span style=\"float:right;font-size:12px\"><input type=\"checkbox\" id=\"no_back_event\"> 结论不回填至病历</span></div></div>
    ...    assessItemWordIds={"wordId":"311666","isSelected":0},{"wordId":"311596","isSelected":1},{"wordId":"16476","isSelected":0},{"wordId":"10282","isSelected":0},{"wordId":"311597","isSelected":0},{"wordId":"311598","isSelected":0},{"wordId":"97599","isSelected":0},{"wordId":"4157","isSelected":0},{"wordId":"311599","isSelected":0},{"wordId":"311600","isSelected":0},{"wordId":"10692","isSelected":0},{"wordId":"311603","isSelected":0},{"wordId":"311604","isSelected":0},{"wordId":"311605","isSelected":0},{"wordId":"311595","isSelected":0},{"wordId":"127270","isSelected":0},{"wordId":"310906","isSelected":0},{"wordId":"311606","isSelected":0},{"wordId":"312666","isSelected":0},{"wordId":"312667","isSelected":0},{"wordId":"311609","isSelected":0},{"wordId":"311610","isSelected":0},{"wordId":"311611","isSelected":0},{"wordId":"311612","isSelected":0},{"wordId":"311613","isSelected":0},{"wordId":"119840","isSelected":0},{"wordId":"149304","isSelected":0},{"wordId":"311614","isSelected":0},{"wordId":"311615","isSelected":0},{"wordId":"311616","isSelected":0},{"wordId":"311617","isSelected":0}
    ${getRes}    查询惠每评估表    doctorGuid=424054    assessId=440    serialNumber=1566805231782    userGuid=1566805231782
    Should Be Equal As Strings    ${getRes['head']['error']}    0
