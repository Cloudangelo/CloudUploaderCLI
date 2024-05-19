#
param (
    [string]$FilePath
)

#Verify file's existence
$FilePathTest = Test-path -Path $FilePath

if($FilePathTest){
    Write-Host "File exists" -f Cyan
    
    Connect-AzAccount

# Set container name storage account variables 
    $ContainerName = 'container1'
    $ctx = New-AzStorageContext -StorageAccountName 'clouduploadercli' -UseConnectedAccount

    $Blob1HT = @{
        File             = $FilePath
        Container        = $ContainerName
        Blob             = "test.txt"
        Context          = $ctx
        StandardBlobTier = 'Hot'
      }
      Set-AzStorageBlobContent @Blob1HT
    Exit-PSSession
}

#Need to implement a user input validation function instead of abruptly ending
else { 
    Write-Host "File not found" -f Red
    Exit-PSSession
}


