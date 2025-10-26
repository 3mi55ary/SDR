# Output tle file to working directory
curl -o "$(pwd)/active.tle" "https://celestrak.org/NORAD/elements/gp.php?GROUP=active&FORMAT=tle"
