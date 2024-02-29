###################
## Env Variable
###################

SHL_HOME=/shcsw/tomcat/shl
LOG_HOME=/shcsw/tomcat/shl/log
LOGDATE=`date '+%Y%m%d'`
TOMCAT_HOME=/shcsw/tomcat
MS=$1
loop=1
limitLoop=30

###################
## Function
###################

F_LOG()

{
        TIMESTAMP=`date +'%Y/%m/%d %H:%M:%S'`
        echo "[$TIMESTAMP] $*"
}

if [ -z $MS ]; then
        F_LOG "MS variable check FAIL!!" | tee -a $LOG_HOME/reboot_$LOGDATE.log
        exit 0
fi

ps -ef | grep Dserver.name=$MS | grep -v grep | grep -v vi | awk '{print $2}' | \

while read PID
do
        F_LOG "[$PID] Sending Graceful Shutdown Signal to Process...." | tee -a $LOG_HOME/reboot_$LOGDATE.log
        kill -15 $PID
done

while [ $loop -le $limitLoop ]
do
        PID_LIST=(`ps -ef | grep Dserver.name=$MS | grep -v | grep | grep -v vi | awk '{print $2}'`)
        if [ ${#PID_LIST[@]} = 0 ]
        then
                F_LOG "The Process is Completely Shutdown." | tee -a $LOG_HOME/reboot_$LOGDATE.log
                F_LOG "$MS Boot Start!!!" >> $LOG_HOME/reboot_$LOGDATE.log
                sh -x $TOMCAT_HOME/domains/$MS/bin/startup.sh
                F_LOG "$MS Rebooting Complete!!!" >> $LOG_HOME/reboot_$LOGDATE.log
                exit
        else
                for pid in "${PID_LIST[@]}"
                do
                        F_LOG "[$loop/$limitLoop] $pid Waiting for Process....." | tee -a $LOG_HOME/reboot_$LOGDATE.log
                done

                loop=$(( $loop + 1 ))
                sleep 1
                continue
        fi

done

F_LOG "Waiting Time Expires. Force Shutdown Start..."
ps -ef | grep Dserver.name=$MS | grep -v grep | grep -v vi | awk '{print $2}' | \
while read PID
do
        kill -9 $PID
        F_LOG "[$PID] Force Shutdown Complete. " | tee -a $LOG_HOME/reboot_$LOGDATE.log
done

F_LOG "$MS Boot Start!!!" >> $LOG_HOME/reboot_$LOGDATE.log
sh -x $TOMCAT_HOME/domains/$MS/bin/startup.sh
F_LOG "$MS Rebooting Complete!!!" >> $LOG_HOME/reboot_$LOGDATE.log
