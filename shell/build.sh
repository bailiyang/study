#!/bin/bash
command=$1

IsBuildFileIndex(){
    file_index=`pwd`
    #判断是否已经在src目录下
    if [ "${file_index:0-3}" == "src" ]
    then
        cd ../
        file_index=`pwd`
    fi

    #判断是否已经在build目录下
    if [ "${file_index:0-5}" != "build" ]
    then
        #判断当前目录是否存在build目录
        if [ ! -d "${file_index}/build" ]
        then
            #不存在，创建一个新的
            mkdir build
        fi
        cd build
    fi
}

IsBuildFileIndex

if [ "$command" = "help" -o "$command" = "h" -o "$command" = "-h" -o "$command" = "--help" ]
then
    echo "方便的编译工具"
    echo "   命令参数                      作用"
    echo "     ycm          在项目目录下生成ycm需要的补全json文件"
    echo "    无参数        编译当前项目"
    echo "help/h/--help/-h  帮助"
    exit
fi

if [ "$command" = "ycm" ]
then
    cmake ../ -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
    mv ./compile_commands.json ../
    echo "生成compile_commands.json完毕"
    exit
fi

if [ ! -d "$command" ]
then
    cmake ../
    make
    exit
fi
