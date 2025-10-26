# Output tle file to working directory
Invoke-WebRequest -Uri "https://celestrak.org/NORAD/elements/gp.php?GROUP=active&FORMAT=tle" -OutFile "$(Get-Location)\active.tle"
