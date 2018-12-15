
# Ensure to import the WebAdministration module

Import-Module WebAdministration

# Declare the variables

$server = "localhost"

$search = "*"

$wmiQuery=[wmisearcher]"SELECT * FROM __Namespace where NAME like 'WebAdministration' or NAME like 'MicrosoftIISv2'"

$wmiQuery.Scope.Path = "\\" + $server + "\root"

$WebNamespace = $wmiQuery.Get()

# Checking if the the server has IIS installed

if($WebNamespace -like '*WebAdministration*')

{

    "IIS  found on $server"

    $WPlist=Get-WmiObject -NameSpace 'root\WebAdministration' -class 'WorkerProcess' -ComputerName 'LocalHost'

    # Loop through the list of active IIS Worker Processes w3wp.exe and fetch the PID, AppPool Name and the startTime

    forEach ($WP in $WPlist)

    {

        if ($WP.apppoolname -like$search)

        {

           write-host "Found PID:" + $WP.processid + " , AppPool_Name:"  $WP.apppoolname 

             (get-process -ID $WP.processid|select starttime)

        }

    }

}

Else

{

   write-host"WARNING: IIS not detected."

}