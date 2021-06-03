#coding:utf-8
import os

import requests
import json


def get_customer_id():

    #测试环境
    # url = "http://test-mayson.huimeionline.com/cdss/sentry/customerAuth/getCustomerId"

    #预发环境
    # url = "http://profile.huimeionline.com/cdss/sentry/customerAuth/getCustomerId"

    #医院现场
    url = "http://hmservice/cdss/sentry/customerAuth/getCustomerId"

    headers = {

        "Content-Type":"application/json;charset=UTF-8"
    }

    response = requests.post(url=url,headers=headers,data={})

    if response.status_code != 200:

        print(url)

    print(response.content.decode("utf-8"))
    # pass


def get_permission():

    #测试环境
    # url = "http://test-mayson.huimeionline.com/cdss/sentry/customerAuth/getProductNames"

    #预发环境
    # url = "http://profile.huimeionline.com/cdss/sentry/customerAuth/getProductNames"

    #医院现场
    url = "http://hmservice/cdss/sentry/customerAuth/getProductNames"

    headers = {

        "Content-Type":"application/json;charset=UTF-8"
    }

    response = requests.post(url=url, headers=headers, data={})

    if response.status_code != 200:

        print(url)

    permission_dict = json.loads(response.content.decode('utf-8'))
    # permission_dict = {'customizedProduct': [None,'None','Mayson问诊系统患者版', '文献', 'AME', '数据上报', '单病种数据上报', '肿瘤化疗质控', '独立知识库', 'DRG', 'CDR'], 'hospitalization': ['智能推荐mayson住院版', '治疗方案住院版', '知识库住院版'], 'outpatient': ['cdss门诊版', '知识库门诊版', '慢病用药门诊版', '用药合理性门诊版', '治疗方案门诊版', '问诊系统门诊版'], 'qualityControl': ['成人社区获得性肺炎', '小儿肺炎', '川崎病', '非ST段抬高型心肌梗死', '急性心肌梗死', '脑梗死', '短暂性脑缺血发作', '主动脉夹层', '心力衰竭', '妊娠期高血压疾病', '扩张型心肌病', '心绞痛', '肥厚性心肌病', '房颤', '癫痫', '支气管哮喘', '慢性阻塞性肺疾病急性加重', '急性肺栓塞', '肺动脉高压', '永久性心脏起搏器安置术', '经皮冠状动脉介入治疗', '心脏瓣膜置换术', '乳腺癌', '急性冠脉综合征', 'TIA', 'CABG手术', '髋关节置换术', '膝关节置换术', '剖宫产手术', '泌尿道感染', '紫癜性肾炎', '先天性心脏病', 'PCI手术', '脑出血', '疑似感染', '冠状动脉搭桥术', '测试病种', '围手术期预防感染', '肿瘤化疗', '法洛氏四联症根治术', '射频消融术', '主动脉瓣置换术', '二尖瓣置换术', '房间隔缺损手术', '室间隔缺损手术', '支气管炎', '肺癌', '甲状腺癌', '胃癌', '帕金森病', '急性动脉瘤性蛛网膜下腔出血', '胶质瘤', '住院精神疾病', '脑膜瘤', '垂体腺瘤', '异位妊娠', '子宫肌瘤', '甲状腺结节'], 'recordsQualityControl': ['病历质控', '病案质控'], 'riskWarning': {'AI': 1, 'diseaseType': ['孕产妇静脉血栓栓塞', '脓毒症', '糖尿病黄斑水肿管理', '静脉血栓栓塞症', 'APACHE II评分', '房颤管理', 'None','深静脉血栓形成', '肺血栓栓塞症', '血脂异常', '复旦肿瘤妇科VTE']}}
    print(permission_dict)
    return permission_dict


def file_name(customizedProduct_path,hospitalization_path,outpatient_path,riskWarning_path):

    customizedProduct_list = []
    hospitalization_list = []
    outpatient_list = []
    riskWarning_list = []

    #单独产品
    for root, dirs, files in os.walk(customizedProduct_path):

        for dir in dirs:
            customizedProduct_list.append(dir)

    #住院版
    for root, dirs, files in os.walk(hospitalization_path):

        for dir in dirs:
            hospitalization_list.append(dir)

    #门诊版
    for root, dirs, files in os.walk(outpatient_path):

        for dir in dirs:
            outpatient_list.append(dir)

    #临床风险预警
    for root, dirs, files in os.walk(riskWarning_path):

        for dir in dirs:
            riskWarning_list.append(dir)

    return customizedProduct_list, hospitalization_list, outpatient_list, riskWarning_list


def create_file(permission_dict,customizedProduct_path,hospitalization_path,outpatient_path,riskWarning_path):

    customizedProduct_list, hospitalization_list, outpatient_list, riskWarning_list = file_name(customizedProduct_path,hospitalization_path,outpatient_path,riskWarning_path)

    # permission_dict = get_permission()

    #外面的一坨
    if 'customizedProduct' in permission_dict.keys():
        for customizedProduct in permission_dict["customizedProduct"]:

            if customizedProduct not in customizedProduct_list:

                if os.path.exists(customizedProduct_path+"/"+customizedProduct):

                    continue
                else:
                    os.mkdir(customizedProduct_path+"/"+customizedProduct)
                    print("创建了文件夹 %s" %customizedProduct)
                    open(customizedProduct_path+"/"+customizedProduct+"/__init__.robot","w")

    #住院版
    if 'hospitalization' in permission_dict.keys():
        for hospitalization in permission_dict["hospitalization"]:

            if hospitalization not in hospitalization_list:

                if os.path.exists(hospitalization_path+"/"+hospitalization):

                    continue
                else:
                    os.mkdir(hospitalization_path+"/"+hospitalization)
                    print("创建了文件夹 %s" %hospitalization)
                    open(hospitalization_path+"/"+hospitalization+"/__init__.robot","w")

    #门诊版
    if 'outpatient' in permission_dict.keys():
        for outpatient in permission_dict["outpatient"]:

            if outpatient not in outpatient_list:

                if os.path.exists(outpatient_path+"/"+outpatient):

                    continue
                else:
                    os.mkdir(outpatient_path+"/"+outpatient)
                    print("创建了文件夹 %s" %outpatient)
                    open(outpatient_path+"/"+outpatient+"/__init__.robot","w")

    #临床风险预警
    if 'riskWarning' in permission_dict.keys():
        for riskWarning in permission_dict["riskWarning"]["diseaseType"]:

            if riskWarning not in riskWarning_list:

                if riskWarning == "APACHE II评分":
                    if os.path.exists(riskWarning_path+"/APACHEII评分"):

                        continue
                    else:
                        os.mkdir(riskWarning_path+"/APACHEII评分")
                        print("创建了文件夹 APACHEII评分")
                        open(riskWarning_path+"/APACHEII评分"+"/__init__.robot","w")
                        os.mkdir(riskWarning_path+"/AI/AIAPACHEII评分")
                        print("创建了文件夹 AIAPACHEII评分")
                        open(riskWarning_path+"/AI/AIAPACHEII评分"+"/__init__.robot","w")
                else:
                    if os.path.exists(riskWarning_path+"/"+riskWarning):

                        continue
                    else:
                        os.mkdir(riskWarning_path+"/"+riskWarning)
                        print("创建了文件夹 %s" %riskWarning)
                        open(riskWarning_path+"/"+riskWarning+"/__init__.robot","w")
                        os.mkdir(riskWarning_path+"/AI/AI"+riskWarning)
                        print("创建了文件夹 AI%s" %riskWarning)
                        open(riskWarning_path+"/AI/AI"+riskWarning+"/__init__.robot","w")


def write_command(permission_dict):

    qualityControl_list = ['CABG手术', '心力衰竭', '心绞痛', '膝关节置换术', '房颤', '脑梗死', '慢性阻塞性肺疾病急性加重', '癫痫', '短暂性脑缺血发作', '急性心肌梗死', '髋关节置换术', '剖宫产手术', '成人社区获得性肺炎']

    customized_product_str = ""
    quality_control_str = ""
    risk_warning_ai = ""
    risk_warning = ""
    first_command = 'pybot -e skip '

    #门诊版
    if "outpatient" in permission_dict.keys():
        outpatient_list = list(filter(None, permission_dict["outpatient"]))
        for item in outpatient_list:

            if item == 'None' or item == None:
                continue

            customized_product_str = customized_product_str + "门诊版/" + item + " "

    #住院版
    if "hospitalization" in permission_dict.keys():
        for item in permission_dict["hospitalization"]:

            if item == 'None' or item == None:
                continue

            customized_product_str = customized_product_str + "住院版/" + item + " "

    #病历质控
    if "recordsQualityControl" in permission_dict.keys():
        for item in permission_dict["recordsQualityControl"]:

            if item == 'None' or item == None:
                continue

            customized_product_str = customized_product_str + "病历质控/" + item + " "

        customized_product_str = customized_product_str + "病历质控/病案室端 "

    #DRG
    if "drg" in permission_dict.keys():
        for item in permission_dict["drg"]:

            if item == 'None' or item == None:
                continue

            customized_product_str = customized_product_str + "DRG/" + item + " "

    #其他的一坨
    if "customizedProduct" in permission_dict.keys():
        for item in permission_dict["customizedProduct"]:

            if item == 'None' or item == None:
                continue

            customized_product_str = customized_product_str + item + " "

    #质控
    if "qualityControl" in permission_dict.keys():
        for item in qualityControl_list:

            if item in permission_dict["qualityControl"]:

                quality_control_str = quality_control_str + "质控/" + item + " "
            else:

                continue
        #
        # for item in permission_dict["qualityControl"]:
        #
        #     if item == 'None' or item == None:
        #         continue
        #     if item == '哮喘（儿童，住院）':
        #         quality_control_str = quality_control_str + "质控/" + "哮喘儿童住院 "
        #     else:
        #         quality_control_str = quality_control_str + "质控/" + item + " "

    #临床风险预警
    if "riskWarning" in permission_dict.keys():
        if permission_dict["riskWarning"]["AI"] == 0:

            for item in permission_dict["riskWarning"]["diseaseType"]:
                if item == 'None' or item == None:
                    continue
                if item == "APACHE II评分":
                    risk_warning = risk_warning + "临床风险预警/" + "APACHEII评分 "
                else:
                    risk_warning = risk_warning + "临床风险预警/" + item + " "


        else:

            for item in permission_dict["riskWarning"]["diseaseType"]:
                if item == 'None' or item == None:
                    continue

                if item == "APACHE II评分":
                    risk_warning_ai = risk_warning_ai + "临床风险预警/AI/" + "AI" + "APACHEII评分 "
                else:
                    risk_warning_ai = risk_warning_ai + "临床风险预警/AI/" + "AI" + item + " "





    final_command = first_command + customized_product_str + quality_control_str + risk_warning_ai + risk_warning + "平台/"

    return final_command



if __name__ == "__main__":

    get_customer_id()
    permission_dict = get_permission()
    create_file(permission_dict=permission_dict,customizedProduct_path="./",hospitalization_path="./住院版",outpatient_path="./门诊版",riskWarning_path="./临床风险预警")
    print(write_command(permission_dict))
    # print(permission_dict)
    os.system(write_command(permission_dict))
