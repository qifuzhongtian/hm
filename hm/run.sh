#!/bin/bash
#function
python_model_check()
{
  if python -c "import $1" >/dev/null 2>&1
  then
      echo "1"
  else
      echo "0"
  fi
}

result=`python_model_check requests`
if [ $result == 1 ]
then
  python3 getpermissions.py
else
  echo "没有找到requests模块，请安装requests模块"
fi