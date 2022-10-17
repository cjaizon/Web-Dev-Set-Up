function Menu {
    Clear-Host
Write-Host "========= Chose an Option ========="
    
$choice = Read-Host "
    1: Audio
    2: Video
    3: Live

    0: Update

Chose the meida type"
        switch ($choice) {
            1 { $type='Audio' } 
            2 { $type='Video' }
            3 { $type='Live' }
            0 { $type='Update' }
        }
        switch ($choice) {
            1 { $dir='Music' } 
            2 { $dir='Videos' } 
            3 { $dir='Videos/Live' } 
            0 { $dir='Update' } 
        }

    Clear-Host
    if($type -ne 'Update') {
        $file = Read-Host `"$type`" "chosen, now enter the URL"
    }
    return $dir, $file
}

$dir, $file = Menu

function Save-Live (){
    $hsl =  Read-Host "
Copy the above hsl and paste here

"

ffmpeg -i $hsl -c copy 'D:\Video\Live\Live.ts'
# ffmpeg -i $hsl -c copy $env:userprofile'/'$dir'/Live.ts'

}

Clear-Host
Write-Host 'Starting...
'
switch ($dir) 
{
    'Update'{
       yt-dlp -U
    }
    'Music' {
        #yt-dlp $file -x --audio-format mp3 -o $env:userprofile'/'$dir'/youtube-dl/%(title)s.%(ext)s'
       yt-dlp $file -x --audio-format mp3 -o 'D:\Audio\Audios Baixados/%(title)s.%(ext)s'
        ii 'D:\Audio\Audios Baixados/'
        # ii $env:userprofile'/'$dir'/youtube-dl/'
    } 
    'Videos' {
        #yt-dlp $file -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best  -o $env:userprofile'/'$dir'/youtube-dl/%(title)s.%(ext)s'
       yt-dlp $file -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best  -o 'D:\Video\Videos Baixados/%(title)s.%(ext)s'
        ii 'D:\Video\Videos Baixados'
        # ii $env:userprofile'/'$dir'/youtube-dl/'
    }
    'Videos/Live' {
       yt-dlp $file -f best -g 
        Save-Live
    }
} 

Write-Host '
Finished!
'