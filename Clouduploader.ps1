#
param (
    [string]$FilePath
)

#Verify file's existence
$FilePathTest = Test-path -Path $FilePath

if($FilePathTest){
    Write-Host "File exists" -f Cyan
    Connect-AzAccount
    $Blob1HT = @{
        File             = 'D:\Images\Image001.jpg'
        Container        = $ContainerName
        Blob             = "Image001.jpg"
        Context          = $Context
        StandardBlobTier = 'Hot'
      }
      Set-AzStorageBlobContent @Blob1HT
    Exit-PSSession
}
else { 
    Write-Host "File not found" -f Red
    Exit-PSSession
}


