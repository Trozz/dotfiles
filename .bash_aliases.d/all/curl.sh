alias curlinfo="curl -sSkvo /dev/null -w '\n\n Status Code: %{http_code}\n Connect: %{time_connect}\n NS Lookup: %{time_namelookup}\n Pre-Transfer: %{time_pretransfer}\n First Byte: %{time_starttransfer}\n Total: %{time_total} \n' "