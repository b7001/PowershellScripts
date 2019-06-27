$v = (New-Object System.Net.WebClient).DownloadString('https://www.flickr.com/services/feeds/photos_public.gne')

function mid{param($start,$finish,$src)
$si=$src.IndexOf($start) + $start.length
$fi=$src.IndexOf($finish,$si) - $si
return $src.Substring($si,$fi)
}

$url=mid -start 'img src=&quot;' -finish '&quot;' -src $v
$url=$url.replace("_m", "")
$f=-join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
$f = "$env:temp\$f.jpg"
(New-Object System.Net.WebClient).DownloadFile($url, $f)
echo $f
start $f
start-sleep 5
remove-item $f
