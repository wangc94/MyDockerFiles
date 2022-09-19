#!/bin/bash
# -e LOCAL_USER_ID="id -u ${USER}"
# if [ "$(id -u)" -eq "0" ]
# then
#     # USER_ID=${LOCAL_USER_ID:-9001}
#     # userdel user
#     # groupadd -g ${USER_ID} user
#     # useradd -l -m -u ${USER_ID} -g user -s /bin/bash user > /dev/null 2>&1
#     # export HOME=/home/user
#     # chmod -R 777 $HOME
#     chown -R 1500:1500 /swis2 > /dev/null 2>&1
    
#     exec gosu 1500 "$@"
# fi

# exec "$@"
service ssh restart
/bin/bashps -e | grep ssh