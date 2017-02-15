#!/bin/bash
#
#

BACK_TITLE="HPC Program"
TABLE_HEIGHT=16
TABLE_WIDTH=58

#
# welcome
#
welcome()
{
    dialog --title "welcome" \
    --backtitle "$BACK_TITLE" --clear --ok-label "Next" \
    --msgbox "Welcome to the HPC Program!" $TABLE_HEIGHT $TABLE_WIDTH
    result=$?
    if [ $result -eq 1 ] ; then
        exit 1;
    elif [ $result -eq 255 ]; then
        exit 1;
    fi
        ecinstlic
}

#
# licence验证模块，分两步，具体描述。。。
# ecinstlic
#
ecinstlic()
{
    dialog --title "ecinstlic" \
    --backtitle "$BACK_TITLE" --clear \
    --yesno "Install the licence or not ? \nThis decesion have to make by you. " $TABLE_HEIGHT $TABLE_WIDTH
    result=$?
    if [ $result -eq 1 ] ; then
        exit 1;
    elif [ $result -eq 255 ]; then
        exit 1;
    fi
        ecgetlic
}

#
# ecgetlic
#
ecgetlic()
{
    dialog --title "ecgetlic" \
    --backtitle "$BACK_TITLE" --clear \
    --yesno "Get the licence or not ? \nThis decesion have to make by you. " $TABLE_HEIGHT $TABLE_WIDTH
    result=$?
    if [ $result -eq 1 ] ; then
        exit 1;
    elif [ $result -eq 255 ]; then
        exit 1;
    fi
        ecverifyenv
}

#
# 系统初始化模块，分三步，具体描述。。。
# ecverifyenv
#
ecverifyenv()
{
    declare -i PERCENT=0
    (
        for I in /tmp/*;do
                if [ $PERCENT -le 100 ];then
                        # do something
                        echo "Copy the file $I ..."
                        echo $PERCENT  
                fi
        let PERCENT+=10
        sleep 1
        done
    ) |
    dialog --title "ecverifyenv" \
    --backtitle "$BACK_TITLE" --clear \
    --gauge "Verify the system environment..." 6 50 0
    ecinstsw
}

#
# ecinstsw
#
ecinstsw()
{
    declare -i PERCENT=0
    (
        for I in /tmp/*;do
                if [ $PERCENT -le 100 ];then
                        # do something
                        echo "Copy the file $I ..." 
                        echo $PERCENT  
                fi
        let PERCENT+=10
        sleep 1
        done
    ) |
    dialog --title "ecinstsw" \
    --backtitle "$BACK_TITLE" --clear \
    --gauge "Install the software..." 6 50 0
    ecconfigenv
}

#
# ecconfigenv
#
ecconfigenv()
{
    declare -i PERCENT=0
    (
        for I in /tmp/*;do
                if [ $PERCENT -le 100 ];then
                        # do something
                        echo "Copy the file $I ..."
                        echo $PERCENT  
                fi
        let PERCENT+=10
        sleep 1
        done
    ) |
    dialog --title "ecconfigenv" \
    --backtitle "$BACK_TITLE" --clear \
    --gauge "Config the system environment..." 6 50 0
    ecconfigvg
}

#
# 软件定制模块，分三步
# ecconfigvg
#
ecconfigvg()
{
    declare -i PERCENT=0
    (
        for I in /tmp/*;do
                if [ $PERCENT -le 100 ];then
                        # do something
                        echo "Copy the file $I ..."
                        echo $PERCENT  
                fi
        let PERCENT+=10
        sleep 1
        done
    ) |
    dialog --title "ecconfigvg" \
    --backtitle "$BACK_TITLE" --clear \
    --gauge "Config the vg equipment..." 6 50 0
    ecconfiglv
}

#
# ecconfiglv
#
ecconfiglv()
{
    declare -i PERCENT=0
    (
        for I in /tmp/*;do
                if [ $PERCENT -le 100 ];then
                        # do something
                        echo "Copy the file $I ..."
                        echo $PERCENT  
                fi
        let PERCENT+=10
        sleep 1
        done
    ) |
    dialog --title "ecconfiglv" \
    --backtitle "$BACK_TITLE" --clear \
    --gauge "Config the lv equipment..." 6 50 0
    ecsharesrpt
}

#
# ecsharesrpt
#
ecsharesrpt()
{
    declare -i PERCENT=0
    (
        for I in /tmp/*;do
                if [ $PERCENT -le 100 ];then
                        # do something
                        echo "Copy the file $I ..."
                        echo $PERCENT  
                fi
        let PERCENT+=10
        sleep 1
        done
    ) |
    dialog --title "ecconfigenv" \
    --backtitle "$BACK_TITLE" --clear \
    --gauge "Config the scst environment..." 6 50 0
    finish
}

#
# 操作完成
# finish
#
finish()
{
    dialog --title "finish" \
    --backtitle "$BACK_TITLE" --clear --ok-label "DONE" \
    --msgbox "Finish the HPC Program!" $TABLE_HEIGHT $TABLE_WIDTH
    result=$?
    if [ $result -eq 1 ] ; then
        exit 1;
    elif [ $result -eq 255 ]; then
        exit 1;
    fi
}

#
# start
#
welcome
