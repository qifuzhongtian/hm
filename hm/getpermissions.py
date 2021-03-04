import os

import requests
import json


def get_customer_id():

    # url = "http://hmservice/"
    # url = "http://test-mayson.huimeionline.com/cdss/sentry/customerAuth/getCustomerId"
    # url = "http://profile.huimeionline.com/cdss/sentry/customerAuth/getCustomerId"

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

    # url = "http://test-mayson.huimeionline.com/cdss/sentry/customerAuth/getProductNames"
    # url = "http://profile.huimeionline.com/cdss/sentry/customerAuth/getProductNames"

    url = "http://hmservice/cdss/sentry/customerAuth/getProductNames"

    headers = {

        "Content-Type":"application/json;charset=UTF-8"
    }

    response = requests.post(url=url, headers=headers, data={})

    if response.status_code != 200:

        print(url)

    permission_dict = json.loads(response.content.decode('utf-8'))
    print(permission_dict)
    return permission_dict


def write_command(permission_dict):

    customized_product_str = ""
    quality_control_str = ""
    risk_warning_ai = ""
    risk_warning = ""
    first_command = 'pybot -e skip '

    #门诊版
    if "outpatient" in permission_dict.keys():
        for item in permission_dict["outpatient"]:

            customized_product_str = customized_product_str + "门诊版/" + item + " "

    #住院版
    if "hospitalization" in permission_dict.keys():
        for item in permission_dict["hospitalization"]:

            customized_product_str = customized_product_str + "住院版/" + item + " "

    #病历质控
    if "recordsQualityControl" in permission_dict.keys():
        for item in permission_dict["recordsQualityControl"]:

            customized_product_str = customized_product_str + "病历质控/" + item + " "

    #其他的一坨
    if "product" in permission_dict.keys():
        for item in permission_dict["product"]:

            customized_product_str = customized_product_str + item + " "

    #质控
    if "qualityControl" in permission_dict.keys():
        for item in permission_dict["qualityControl"]:

            quality_control_str = quality_control_str + "质控/" + item + " "

    #临床风险预警
    if "riskWarning" in permission_dict.keys():
        if permission_dict["riskWarning"]["AI"] == 0:

            for item in permission_dict["riskWarning"]["diseaseType"]:

                risk_warning = risk_warning + "临床风险预警/" + item + " "
        else:

            for item in permission_dict["riskWarning"]["diseaseType"]:

                risk_warning_ai = risk_warning_ai + "临床风险预警/AI/" + "AI" + item + " "



    final_command = first_command + customized_product_str + quality_control_str + risk_warning_ai + risk_warning + "平台/"

    return final_command



if __name__ == "__main__":

    get_customer_id()
    permission_dict = get_permission()
    print(write_command(permission_dict))
    # print(permission_dict)
    os.system(write_command(permission_dict))
