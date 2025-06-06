$targetFile = $args[0]
$newVersion = $args[1]

$date = [System.DateTime]::Now.ToString("ddd, dd MMM yyyy")
$time = [System.DateTime]::Now.ToString("HH:mm:ss")
$offset = [System.TimeZoneInfo]::Local.GetUtcOffset([System.DateTime]::Now)
$tzoff = if ($offset -lt [TimeSpan]::Zero) {"\-"} else {"\+"}
$tz = $offset.ToString("${tzoff}hhmm")

$contents = $(Write-Output "bskyid (${newVersion}-1) noble; urgency=medium`n")
$contents += $(Write-Output "`n")
$contents += $(Write-Output "  * Please populate changelogs here`n")
$contents += $(Write-Output "`n")
$contents += $(Write-Output " -- Aptivi CEO <ceo@aptivi.anonaddy.com>  $date $time $tz`n`n")

$contents += [System.IO.File]::ReadAllText($targetFile)

[System.IO.File]::WriteAllText($targetFile, $contents)
