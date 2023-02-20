function TestValid {
    param (
        $valid
    )

    
    if (!$valid) {
        Write-Host "No one content has been write, try again"
        Pause
        Exit
    }
}

$ytURL = Read-Host "Paste or type youtube URL!
Make sure you have yt-dlp
URL: "

if (!$ytURL) {
    Write-Host "No one content has been write, try again"
    Pause
    Exit
}

$downloadURL = yt-dlp.exe -f 140 $ytURL --get-url

Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }


Write-Host "Now gonna ask file metadata, make sure you have have the cover file."
$coverFile = $FileBrowser.ShowDialog()

TestValid($coverFile)

$titleFile = Read-Host "Title: "
TestValid($titleFile)
$albumName = Read-Host "Album: "
TestValid($albumName)
$artistName = Read-Host "Artist: "
TestValid($artistName)
$genreName = Read-Host "Genre: "
TestValid($genreName)

Pause
Exit
