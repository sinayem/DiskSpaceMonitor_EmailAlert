##############################################################		
##  AUTHOR: Shajibul Islam Nayem			    ##
##  		 					    ##
##  DATE: 20-09-23					    ##
##							    ##
##  Monitor disk space and send email alert if 		    ##
##  threshold value 50GB exceeded.	                    ##	
##							    ##	
##############################################################


##############################################################
#Define the threshold value (50GB) eg. If any disk space is less than 50 GB
$threshold = 50

##############################################################
#Define the email settings
$smtpServer = "smtp.gmail.com"
$smtpPort = 587
$senderAddress = "shajibulislamnayem19@gmail.com"
$receiverAddress = "sinayem88@gmail.com"
$smtpUsername = 'shajibulislamnayem19@gmail.com'
#App password for sender google account.
$smtpPassword = 'gcxt anjo hdnw wuzd'

##############################################################
#Get all logical disks
$disks = gwmi -query "SELECT Caption,VolumeName,Size,Freespace,DeviceID FROM win32_logicaldisk WHERE DriveType=3"

##############################################################
#Configure the mail
$smtp = New-Object Net.Mail.SmtpClient($smtpServer,587)
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential( $smtpUsername , $smtpPassword );
$msg = New-Object Net.Mail.MailMessage
$msg.To.Add($receiverAddress)
$msg.From = $senderAddress
$msg.Subject = 'Low Disk Space Alert! '+ $disk
$header = "This report was generated because the drive's listed below have less than $threshold GB free space."
$msg.Body = $header + "`n"
#A flag var to track, if this is true then the mail will be sent
$flag = 0

###############################################################
# Iterate through each disk 
foreach ($disk in $disks) {
    # Calculate the percentage of free space
    $freeSpace = [Math]::Round([float]$disk.FreeSpace / 1073741824, 2);
    $totalSizeGB = [math]::Round($disk.Size / 1073741824, 2)
    $report += $disk.DeviceId + " Remaining "+ $freeSpace + " GB --- Total Size: " + $totalSizeGB + "`n"
    # Check if the threshold is exceeded 
    if ($freeSpace -lt $threshold) {
	$msg.Body += $disk.DeviceId + " " + $freeSpace + " GB Remaining" + "`n"
	$flag = 1
    }
}

if ($flag -eq 1){
$msg.Body += "`n"+ "Report :" + "`n" + $report +"`n";
$smtp.Send($msg)
}

#End of script
#############################################################
