#! /bin/bash
service vsftpd start;
adduser --gecos "" $USER_FTP;
echo "$USER_FTP:$PASS_FTP" | chpasswd;
mkdir -p /home/$USER_FTP;
chown "$USER_FTP:$USER_FTP" /home/$USER_FTP;
echo "$USER_FTP" >> /etc/vsftpd.userlist
echo "anonymous_enable=NO" >> /etc/vsftpd.conf;
echo "local_enable=YES" >> /etc/vsftpd.conf;
echo "write_enable=YES" >> /etc/vsftpd.conf;
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;
echo "chroot_local_user=YES" >> /etc/vsftpd.conf;
echo "user_sub_token=$USER_FTP" >> /etc/vsftpd.conf;
echo "local_root=/home/$USER_FTP" >> /etc/vsftpd.conf;
echo "pasv_min_port=60000" >> /etc/vsftpd.conf;
echo "pasv_max_port=60005" >> /etc/vsftpd.conf;
echo "userlist_enable=YES" >> /etc/vsftpd.conf;
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf;
echo "userlist_deny=NO" >> /etc/vsftpd.conf;

service vsftpd stop;
vsftpd
