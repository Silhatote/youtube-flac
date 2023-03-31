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


Add-Type -AssemblyName System.Windows.Forms
$FileBrowserAudio = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = $PWD
    Filter = "Audio|*.flac;*.mp3"
    Title = "Select Audio"
}

Write-Host "Select audio file:"
$testAudio = $FileBrowserAudio.ShowDialog()

if ($testAudio -eq "Cancel") {
    Exit
}

$filename = $FileBrowserAudio.SafeFileName

$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    InitialDirectory = $PWD
    Filter = "Image (*.png)|*.png"
    Title = "Select a image"
 }


Write-Host "Select image."
$test = $FileBrowser.ShowDialog()

if ($test -eq "Cancel") {
    Exit
}

ffmpeg.exe -i $FileBrowserAudio.FileName -i $FileBrowser.FileName -c copy -map 0 -map 1 -disposition:v attached_pic "$filename"
Pause
Exit
