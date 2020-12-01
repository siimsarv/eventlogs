
#Since MS by default allows you to only run signed scripts
#you need to first run the following command to bypass executuion policy
#for the current Session.
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass


#Since we will be running a custom source we first need to create this source.
#You can do this with the following command
#New-EventLog -LogName Application -Source "Test Source"

#how many events to send
$max = 200000

#Sending a message to user that script has started
Write-Host "Starting..."

#generate $max amount of events
for($i = 1;$i -le $max;$i++ ){
    
    #time of event
    $time = Get-Date -Format "HH:mm:ss.fff"

    #generating event
    Write-EventLog -LogName Application -Source "Test Source" -EntryType Information -EventID 1 -Message "This is a test event nr $i generated at $time"

    #send message every 10%
    if($i % ($max/10) -eq 0){
        Write-Host "$i sent"
    }
}

#Sending a message to user that script has ended
Write-Host "Done generating $max events"
