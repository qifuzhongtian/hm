# *** Settings ***
# Suite Setup       cdr登录    name=privateTesting    password=38ebcce4a466e04bf443d54ca52cd44f
# Suite Teardown    Delete All Sessions
# Resource          ../../cdss.robot
# Library           Collections
# Library           RequestsLibrary
# Library           String
# Library           DateTime

# *** Variables ***

# *** Test Cases ***

# cdr病历管理_高级搜索_搜索
#     [Documentation]    :3025/advancedSearch/search
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    cdr病历管理_高级搜索_搜索    pageSize=${20}    currentPage=${1}
#     ...    html=<div class=\"rapport-box-list active\"><ul><li class=\"table_type_2\" id=\"1\" type=\"2\" typeid=\"1\" name=\"基本信息\"><div class=\"clearfix item-list\"> <div class=\"clearfix inquire-type-2 inquire-part\" desc=\"基本信息\"><div class=\"first-td l\" data=\"基本信息\"><div class=\"first-td-name\" style=\"top:6px\">基本信息</div></div><div class=\"l con-td inquire-type\"><div class=\"drop-down-input\"><select id=\"00-0-inquire-select-val\" name=\"1\" class=\"form-control select-type inquire-select-val inquire-div-name\"><option value=\"\">请选择</option> <option id=\"38\" desc=\"38\" value=\"性别\" value_type=\"6\" dict_type=\"5\" word_type=\"\" name=\"性别\">性别</option> <option id=\"39\" desc=\"39\" value=\"年龄\" value_type=\"5\" dict_type=\"\" word_type=\"\" name=\"年龄\">年龄</option> </select></div></div> <div class=\"l second-td inquire-value inquire-radio-sex inquire-div-name inquire-type-list-new\" id=\"00-0-inquire-radio-sex\" name=\"4\"><div class=\"clearfix\"><span class=\"drop-down-radio r\"><input type=\"radio\" name=\"sex\" value=\"0\" class=\"radio-btn\">女 </span><span class=\"drop-down-radio r\"><input type=\"radio\" name=\"sex\" value=\"1\" class=\"radio-btn\">男</span></div></div> <div class=\"last-td l\"><span class=\"add_btn\"><i class=\"fa fa-bars\" aria-hidden=\"true\"></i></span> <span class=\"close_btn\"><i class=\"fa fa-times\" aria-hidden=\"true\"></i></span></div></div> <div class=\"clearfix inquire_5 hide inquire-type-list inquire-type-list-new\"><div class=\"first-td l\">&nbsp;</div><div class=\"l con-td\"><div class=\"clearfix\"><input type=\"text\" class=\"form-control inpput-int l lower-val inquire-div-name\" name=\"2\" placeholder=\"请输入数值\" id=\"00-0-inquire-lower-val\" autocomplete=\"off\"> <span class=\"drop-down-span r\"><select class=\"form-control inpput-int lower-unit inquire-div-name\" id=\"00-0-inquire-lower-unit\" name=\"1\"><option value=\"岁\" desc=\"岁\">岁</option><option value=\"月\" desc=\"月\">月</option><option value=\"天\" desc=\"天\">天</option></select></span></div></div><div class=\"l second-td\"><div class=\"drop-down-check clearfix\">---</div></div><div class=\"l con-td\"><div class=\"clearfix\"><input type=\"text\" name=\"2\" class=\"form-control inpput-int l upper-val inquire-div-name\" id=\"00-0-inquire-upper-val\" placeholder=\"请输入数值\" autocomplete=\"off\"> <span class=\"drop-down-span r\"><select class=\"form-control inpput-int upper-unit inquire-div-name\" id=\"00-0-inquire-upper-unit\" name=\"1\"><option value=\"岁\" desc=\"岁\">岁</option><option value=\"月\" desc=\"月\">月</option><option value=\"天\" desc=\"天\">天</option></select></span></div></div><div class=\"last-td l\"><div class=\"drop-down-check\"></div></div></div> </div></li></ul><i class=\"fa fa-trash-o close-btn-box\" aria-hidden=\"true\"></i></div>
#     ...    htmlValue=[{\"id\":\"00-0-inquire-select-val\",\"type\":\"1\",\"val\":\"性别\"},{\"id\":\"00-0-inquire-radio-sex\",\"type\":\"4\",\"val\":\"0\"},{\"id\":\"00-0-inquire-lower-val\",\"type\":\"2\",\"val\":\"\"},{\"id\":\"00-0-inquire-lower-unit\",\"type\":\"1\",\"val\":\"岁\"},{\"id\":\"00-0-inquire-upper-val\",\"type\":\"2\",\"val\":\"\"},{\"id\":\"00-0-inquire-upper-unit\",\"type\":\"1\",\"val\":\"岁\"}]
#     ...    queryConditionGroupList={"queryConditionItemList":[{"rulePartName":"基本信息","rulePartId":"1","searchConditionType":"2","partId":"1","queryConditionItemObjectList":[{"propertyId":"38","propertyName":"性别","propertyType":"6","propertyValue":"0"}]}]}
#     # ${aj}    Evaluate    [aj['ruleCode'] for aj in $getRes['result']]
#     Should Be Equal As Strings    ${getRes['head']['error']}    0





