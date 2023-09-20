# DiskSpaceMonitor_EmailAlert
## Create a PowerShell script to monitor disk space and send email alert if the threshold value 80% exceeded.
My laptop's disk space <br>
<img width="395" alt="image" src="https://github.com/sinayem/DiskSpaceMonitor_EmailAlert/assets/68912545/bfe606ee-c36f-4d03-9c70-a1ec6bf5a143"> <br>
I select the threshold value of 50GB (e.g. if any disk has less than 50GB space then an email notification will sent) <br>
SMTP: A Simple Mail Transfer Protocol (SMTP) is a form of communication between servers used to send and receive email. <br>
**smptusername:** sender email address <br>
**smtppassword:** not the sender's email password. <br>
I have faced the **5.7.0 Authentication Required** problem, which I solved by creating an app password. [Reference](https://stackoverflow.com/questions/66044348/sending-mail-from-powershell-via-gmail-smtp)
<br>
<br>
Finally, this is the email I received: <br>
<img width="626" alt="image" src="https://github.com/sinayem/DiskSpaceMonitor_EmailAlert/assets/68912545/2d0ed8f2-07d7-4658-951d-e2bf880409b3">
