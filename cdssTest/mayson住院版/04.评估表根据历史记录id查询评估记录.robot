*** Settings ***
Suite Setup    保存评估历史记录    recordId=424054    assessId=221    assessName=川崎病心脏移植治疗评估表    patientGuid=4361    serialNumber=7225    assessResult=可采取心脏移植治疗    assessConclusion=严重且不可逆的心功能不全建议进行心脏移植治疗    historyItemList={"type": "checkbox","value": "hm_blood_pesi_1-HMID-hm_subresult_ipt"}    source=<div><style>.hm-eva-pane-ne{font-family:\"Microsoft YaHei\";color:#666;font-size:14px;padding:10px 20px 10px 20px;margin-bottom:40px}.hm-eva-pane-ne .hm-eva-level-tit{color:#222;font-size:16px;padding:15px 0 5px 0;display:block}.hm-eva-pane-ne .hm-eva-level-unit{padding:5px 0;clear:both}.hm-eva-pane-ne .hm-eva-level-unit .hm-eva-vt-left{float:left;position:relative;width:50px;padding-left:20px;line-height:25px}.hm-eva-pane-ne .hm-check-rad-span{position:absolute;left:1px;top:5px;width:14px;height:14px;outline:0}.hm-eva-pane-ne .hm-check-rad{margin:0;height:14px;width:14px;padding:0;border:0;position:absolute;left:0;top:0;outline:0}.hm-eva-pane-ne label{outline:0}.hm-eva-pane-ne .hm-eva-level-unit .hm-eva-vt-right{margin-left:70px;line-height:25px}.hm-eva-pane-ne.hm-eva-res-con{position:absolute;bottom:0;padding-bottom:5px;left:0;width:100%;background:#fff;z-index:10}.hm-eva-pane-ne .hm-eva-cal-res{padding:5px 10px;border-radius:5px;background-color:#efebd9;line-height:22px;display:none;width:900px;margin-left:15px}.hm-eva-pane-ne .hm-eva-cal-res .hm-ev-u{padding-right:15px}.hm-eva-pane-ne .hm-eva-cal-res .hm-t{color:#000}.hm-eva-pane-ne .hm-check-rad-span{position:absolute;left:1px;top:5px;width:14px;height:14px;outline:0}.hm-eva-pane-ne#hm_eva_common_hct_12 .hm-eva-sl-ful,.hm-eva-pane-ne#hm_eva_common_hct_7 .hm-eva-sl-ful,.hm-eva-pane-ne#hm_eva_common_hct_8 .hm-eva-sl-ful,.hm-eva-pane-ne .hm-common-hct-c .hm-eva-sl-ful{margin:1px 0;padding-left:0}.hm-eva-pane-ne .hm-eva-level-co{width:100%;overflow:hidden;line-height:25px}.hm-eva-pane-ne .hm-eva-sl{width:100%;display:inline-block;position:relative;padding-left:20px}.hm-eva-pane-ne .hm-eva-sl.active{color:#4eaaf7}.hm-eva-pane-ne .hm-check-i{margin:0;height:14px;width:14px;padding:0;border:0;position:absolute;left:0;top:0;outline:0}.hm-eva-pane-ne .hm-eva-descript{background:#f0f3f4;padding:5px 10px}.hm-eva-pane-ne .hm-check-i-span{position:absolute;width:14px;height:14px;left:1px;top:5px;outline:0}.hm-eva-pane-ne .hm-eva-sl-ful{width:100%;display:inline-block;position:relative;padding-left:20px}.hm-eva-pane-ne .hm-eva-level-unit1{padding:5px 0;position:relative}.hm-eva-pane-ne .hm-eva-level-unit1 .hm-eva-vt-left{float:left;position:relative;width:50px;padding-left:20px;line-height:25px}.hm-eva-pane-ne .hm-eva-level-unit1 .hm-eva-vt-right{margin-left:70px;line-height:25px}.hm-ev-subU{padding-left:45px}.hm-ev-subU input{vertical-align:middle;position:relative;top:-1px}</style><div id=\"hm_eva_common_cont\" class=\"hm-eva-pane-ne\"><div id=\"hm_eva_common_medical\"><div class=\"hm-eva-level-tit\">满足以下任一条件者，即可采取心脏移植治疗</div><div id=\"hm_eva_common_cot\"><div id=\"hm_eva_common_v1\" class=\"hm-eva-level-co\"><span class=\"hm-eva-sl active\"><span name=\"hm_eva_kpl\" class=\"hm-check-rad-span\"><input id=\"hm_blood_pesi_1\" type=\"checkbox\" name=\"hm_eva_kpl\" class=\"hm-check-rad hm-check\" desc=\"严重且不可逆的心功能不全\"></span><label for=\"hm_blood_pesi_1\">严重且不可逆的心功能不全</label></span></div><div id=\"hm_eva_common_v2\" class=\"hm-eva-level-co\"><span class=\"hm-eva-sl\"><span name=\"hm_eva_kpl\" class=\"hm-check-rad-span\"><input id=\"hm_blood_pesi_2\" type=\"checkbox\" name=\"hm_eva_kpl\" class=\"hm-check-rad hm-check\" desc=\"介入及CABG不可行的冠状动脉病变者\"></span><label for=\"hm_blood_pesi_2\">介入及CABG不可行的冠状动脉病变者</label></span></div></div></div></div><script>!function(o){var i=\"\",l=\"\",m=\"\",a=!0,d=document.getElementById(\"hm_ev_ne_res\"),_=document.getElementById(\"hm_vet_total_sc\"),u=document.getElementById(\"hm_vet_total_cal\"),e=o.findByAttr(\"input[type=checkbox]\",\"hm_eva_common_cot\");function t(){m=l=i=\"\";var e=o.getCheckRadioChecked(\"hm_eva_common_medical\",\"input[type=checkbox][name=hm_eva_kpl]\"),t=\"\";if(1==a&&(o.setCheckedStyle(e,\"active\"),a=!1),e.length){for(var n=0;n<e.length;n++){var c=\"\";0<n&&(c=\"，\"),t+=c+e[n].getAttribute(\"desc\")}d.style.display=\"block\",i=t+\"建议进行心脏移植治疗\",l=m=\"可采取心脏移植治疗\",_.innerHTML=m,u.innerHTML=i}else d.style.display=\"none\",i=m=l=\"\"}o.bind(e,\"onclick\",function(){o.mangeCheckboxStyle(this,\"active\"),t()}),t(),window.getHmEvaReturn=function(){return document.getElementById(\"hm_subresult_ipt\").checked&&(l=i&&m+\":\"+i+\"。\"||m),{result:l,conclusion:m,description:i}}}(window.MaysonPublicPage)</script></div>    resultContent=<div class=\"hm-eva-res-con\"id=\"hm_ev_ne_res\" style=\"display: block;\"><div class=\"hm-eva-cal-res\"><div class=\"hm-ev-u\"><span class=\"hm-t\">结论：</span><span id=\"hm_vet_total_sc\">可采取心脏移植治疗</span></div><div class=\"hm-ev-u hm-ev-subU\"><input id=\"hm_subresult_ipt\" type=\"checkbox\" name=\"hm_subresult_ipt\" checked=\"checked\" class=\"hm_subresult_ipt\"><label for=\"hm_subresult_ipt\" class=\"subStr\">说明：</label><span id=\"hm_vet_total_cal\">严重且不可逆的心功能不全建议进行心脏移植治疗</span></div></div></div>
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名 类型  是否必须    说明
# patientGuid String  是   患者编号
# recordId    Integer 是   病历id
# assessId    String  是   住院就诊编号
# customerId  String  是   customerId
# assessId    Integer 是   评估表id
# assessName  String  是   评估表名称
# assessResult    String  是   评估结果
# assessConclusion    String  是   解释
# source  String  是   页面数据源
# historyItemList List    是   评估历史明细集合
# ----type    String  否   评估类型
# ----value   Double  否   评估结果

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***


############评估历史#############

根据评估历史记录id查询评估记录
    [Documentation]    断言:""
    ${getRes}    根据评估历史记录id查询评估记录    Id=${assessHistoryId}
    Should Be Equal As Strings    ${getRes['head']['error']}    0


