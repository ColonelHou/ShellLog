#!/bin/bash
############################################################################################################
#
#  功    能 : 记录日志;
#  创 建 人 : Colonel.Hou
#  创建时间 : 2014/01/29
#  版    本 : [1.0]
#  详细说明 : 根据传进函数的参数进行记录日志; 四种日志级别:warn,debug,info,error
#  参    数 : 
#  调用实例 : 必须按照以下格式来调用
#             logFileName      = "data.log"	     #日志文件名    :自己添加	
#             currentExecScript= "$BASH_SOURCE"  #当前执行脚本名:一般不需要改动
#             currentExecFunc  = "$FUNCNAME"     #当前执行函数名:一般不需要改动
#             lineNo           = "$LINENO"       #行号          :一般不需要改动
#             message          = "some messgage" #日志记录信息  :自己添加日志信息
#             arrayParam       = ("$currentExecScript" "$currentExecFunc" "$lineNo" "$message" "$logFileName")
#             logInfo[logError|logDebug|logWarn] "${arrayParam[@]}"
#  日志结果 : 2014-04-01 15:05:39 INFO  /usr/local/xxx.sh.someFun:(/usr/local/xxx.sh:73): msg
############################################################################################################
writeLog ()
{
    level=$1 
    fileFunStr=$2
    execFile=$3 
    lineNo=$4 
    msg=$5 
    logfilename=$6
    case $level in
        warn)
            echo -e "`date "+%Y-%m-%d %H:%M:%S"` WARN  $fileFunStr($execFile:$lineNo): $msg  " >> $logfilename
        ;;
        debug)
            echo -e "`date "+%Y-%m-%d %H:%M:%S"` DEBUG $fileFunStr($execFile:$lineNo): $msg  " >> $logfilename
        ;;
        info)
            echo -e "`date "+%Y-%m-%d %H:%M:%S"` INFO  $fileFunStr($execFile:$lineNo): $msg  " >> $logfilename
        ;;
        error)
            echo -e "`date "+%Y-%m-%d %H:%M:%S"` ERROR $fileFunStr($execFile:$lineNo): $msg  " >> $logfilename
        ;;
    esac
}

############################################################################################################
#
#  功    能 : 
#  创 建 人 : Colonel.Hou
#  创建时间 : 2014/01/30
#  版    本 : [1.0]
#  详细说明 : 
#  参    数 : 
#
############################################################################################################
logCommon()
{
    level=$1
    lineNo=$2
    msg=$3
    execFile=$4
    execFileNoPre=${execFile#*./}
    logfilename=$5
    exeFun=$6
    dot="."
    colon=":"
    if [ -z $exeFun ]; then
        fileFunStr=""
    else
        fileFunStr="$execFileNoPre$dot$exeFun$colon"
    fi
    arrParam=("$level" "$fileFunStr" "$execFileNoPre" "$inNo" "$msg" "$logFile")
    writeLog "${arrParam[@]}"
}

############################################################################################################
#
#  功    能 : 记录warn级别日志;
#  创 建 人 : Colonel.Hou
#  创建时间 : 2014/01/30
#  版    本 : [1.0]
#  详细说明 : 切勿随意修改
#  参    数 : 
#
############################################################################################################
logWarn()
{
    level="warn"
    currentExecFileName=$1
    execFun=$2
    inNo=$3
    msg=$4
    logFile=$5
    arrParam=("$level" "$inNo" "$msg" "$currentExecFileName" "$logFile" "$execFun")
    logCommon "${arrParam[@]}"
}

############################################################################################################
#
#  功    能 : 记录info级别日志;
#  创 建 人 : Colonel.Hou
#  创建时间 : 2014/01/30
#  版    本 : [1.0]
#  详细说明 : 切勿随意修改
#  参    数 : 
#
############################################################################################################
logInfo()
{
    level="info"
    currentExecFileName=$1
    execFun=$2
    inNo=$3
    msg=$4
    logFile=$5
    arrParam=("$level" "$inNo" "$msg" "$currentExecFileName" "$logFile" "$execFun")
    logCommon "${arrParam[@]}"
}

############################################################################################################
#
#  功    能 : 记录debug级别日志;
#  创 建 人 : Colonel.Hou
#  创建时间 : 2014/01/30
#  版    本 : [1.0]
#  详细说明 : 切勿随意修改
#  参    数 : 
#
############################################################################################################
logDebug()
{
    level="debug"
    currentExecFileName=$1
    execFun=$2
    inNo=$3
    msg=$4
    logFile=$5
    arrParam=("$level" "$inNo" "$msg" "$currentExecFileName" "$logFile" "$execFun")
    logCommon "${arrParam[@]}"
}

############################################################################################################
#
#  功    能 : 记录error级别日志;
#  创 建 人 : Colonel.Hou
#  创建时间 : 2014/01/30
#  版    本 : [1.0]
#  详细说明 : 切勿随意修改
#  参    数 : 
#
############################################################################################################
logError()
{
    level="error"
    currentExecFileName=$1
    execFun=$2
    inNo=$3
    msg=$4
    logFile=$5
    arrParam=("$level" "$inNo" "$msg" "$currentExecFileName" "$logFile" "$execFun")
    logCommon "${arrParam[@]}"
}
