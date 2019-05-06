#Change the username in "$src" to your real one.
#Change the directory under "$dest" to the one you want to copy to.
#You may have to create the directory in $dest in order for the images to copy successfully.
#This script should only copy files with different names to the ones currently populating your chosen $dest directory.


$src = 'C:\Users\#YOURUSERNAMEHERE#\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets'
$dest = 'C:\Users\#YOURUSERNAMEHERE#\Desktop\Locksceen Images'
# Get all files over 200kb (as big as most of the lockscreen images)
Get-ChildItem -Path $src -Recurse | where { $_.Length -gt 200KB} |
   ForEach-Object {
         # and write it to the correct folder and file name
         $jpg = ".jpg"
         $a = $_.ToString()
         $var = $a+$jpg
         $_ | Copy-Item -Destination {Join-Path $dest $var} -Force
    }
