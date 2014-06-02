How to use Snoop
================


Activate Google Cloud Storage : https://developers.google.com/storage/docs/signup#activate

Install GSUTIL : https://developers.google.com/storage/docs/gsutil_install



Test the script : 
-----------------

     Usage : snoop.sh HTTPPingURL bucketname script cloudSDK tempdir
         HTTPPingURL : HTTP URL to GET for IP ping
         bucketname : name of the Google Cloud Storage bucket for screencapture upload
         URLScript : URL of the script to HTTP GET for execution
         cloudSDK : Directory of Google CLoud SDK
         tempdir : temp directory for image manipulation

Exemple :

    ./snoop.sh https://myservertoping/snoop myGoogleCloudStorageBucket https://myscripttoexecute/script.sh  / User/me/google-cloud-sdk/ /User/me/myTempDirectory


Add a cronjob :
---------------

Execute :

    EDITOR=/usr/bin/emacs crontab  -e

Add a cron job :

    */1 * * * * /fullpathtoyourscript/snoop.sh  https://myservertoping/snoop myGoogleCloudStorageBucket https://myscripttoexecute/script.sh /User/me/google-cloud-sdk/ /User/me/myTempDirectory  > /dev/null 2>&1

Check that the cron job is ready

    crontab -l
    

