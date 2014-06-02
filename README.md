snoop
=====


Install GSUTIL : https://developers.google.com/storage/docs/gsutil_install

Create a temp directory : /Users/me/myTempDirectory

Test the script : 
=================

    ./snoop.sh https://myservertoping/snoop myGoogleCloudStorageBucket https://myscripttoexecute/script.sh /User/me/myTempDirectory


Add a cronjob :
===============

Execute :
---------

    EDITOR=/usr/bin/emacs crontab  -e

Add this cron job :
-------------------

    */1 * * * * /fullpathtoyourscript/snoop.sh  https://myservertoping/snoop myGoogleCloudStorageBucket https://myscripttoexecute/script.sh /User/me/myTempDirectory  > /dev/null 2>&1

Check that the cron job is ready
--------------------------------

    crontab -l
    

