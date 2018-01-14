# print system uptime nicely

uptime | awk -F'[ ,:\t\n]+' '{
  msg = "↑ "
  if ($5 == "day" || $5 == "days") {
    msg = msg $4"d "
    n = $6
    o = $7
  } else {
    n = $4
    o = $5
  }
  if (int(o) == 0) {
    msg = msg int(n)" "o
  } else {
    msg = msg int(n)"h "
    msg = msg int(o)"m"
  }
  print msg
}'
