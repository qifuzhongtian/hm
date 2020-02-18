*** Settings ***
Suite Setup       登录    name=qa    password=b98ad386ccff23f74fed60bda2e586f0    # Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
伏羲调度任务更新
    ${date}    get current date
    log    ${date}
    ${hr}    get SubString    ${date}    11    13
    ${minute}    get SubString    ${date}    14    16
    ${mi}    Evaluate    ${minute}+5
    ${id}    Set Variable    47
    ${getRes}    伏羲调度任务更新    id=${id}    remark=【伏羲调度时间规范】    sourceLinkId=57    taskDate=    taskHour=${hr}
    ...    taskMinute=${mi}    taskName=【伏羲调度时间规范】    taskSecond=0    taskSql="CREATE TABLE if not exists jobs_log ( \ \ `id` int(11) NOT NULL AUTO_INCREMENT, \ \ `name` varchar(255) DEFAULT NULL, \ \ `job_date` varchar(255) DEFAULT NULL, \ \ PRIMARY KEY (`id`), \ \ KEY `index_discharge_date` (`name`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; \ \ drop PROCEDURE \ if exists rp_check_rule_cp_detaile_all; CREATE PROCEDURE rp_check_rule_cp_detaile_all() BEGIN \ -- 设置变量 DECLARE success_state INTEGER DEFAULT 0; \ -- 捕获异常 DECLARE CONTINUE HANDLER for SQLEXCEPTION \ BEGIN \ \ \ set success_state =1; \ end ; \ -- 开始事物 START TRANSACTION; \ UPDATE \ task_info \ SET task_status='2',task_flag='1',task_type='1',task_week='0',task_date='0',task_hour='3',task_minute='0',task_second='0' WHERE task_name \ like '%【自动化验收】最低标准验收%'; \ UPDATE \ task_info \ SET task_status='2',task_flag='1',task_type='1',task_week='0',task_date='0',task_hour='4',task_minute='0',task_second='0' WHERE task_name like '%【自动化验收】最低标准验收mayson版%'; \ UPDATE \ task_info \ SET task_status='2',task_flag='1',task_type='1',task_week='0',task_date='0',task_hour='3',task_minute='10',task_second='0' WHERE task_name \ like '%【自动化验收】最低标准未通过样例查询%'; \ UPDATE \ task_info \ SET task_status='2',task_flag='1',task_type='1',task_week='0',task_date='0',task_hour='3',task_minute='20',task_second='0' WHERE task_name \ like \ '%【病种自动化校验】有值率%'; \ UPDATE \ task_info \ SET task_status='2',task_flag='1',task_type='1',task_week='0',task_date='0',task_hour='3',task_minute='30',task_second='0' WHERE task_name \ like \ '%【病种自动化验收】规则校验（心梗，脑梗，肺炎，手术）%'; \ UPDATE \ task_info \ SET task_status='2',task_flag='1',task_type='1',task_week='0',task_date='0',task_hour='7',task_minute='0',task_second='0' WHERE task_name like '%科室管理平台%'; \ UPDATE \ task_info \ SET task_status='2',task_flag='1',task_type='1',task_week='0',task_date='0',task_hour='12',task_minute='0',task_second='0' WHERE task_name like '%【伏羲调度时间规范】%'; \ \ -- 将执行时间插入日志表 insert into jobs_log select null,'【伏羲调度时间规范】',now(); \ if success_state=1 THEN \ \ ROLLBACK; ELSE \ \ COMMIT; end if; END; \ call \ rp_check_rule_cp_detaile_all();"    taskStatus=1    taskType=1
    ...    taskWeek=
    Should Be Equal As Strings    ${getRes['code']}    200
