function admin-supernova () {
	source ~/admin-supernova/bin/activate
}
function ServerListing () {
 supernova test list --fields=name,accessIPv4,metadata | awk 'BEGIN { FS="|" }{print "## Server " $3 " ##\n" "ID: "$2 "\nName:  " $3 "\nIP Address: " $4 "\nmetadata: " $5 "\n"} END{"##############"}'   | grep -v "u'Do-Not-Delete': u'True'\|ID:  ID\|Name:   Name\|IP Address:  accessIPv4\|metadata:  Metadata\|ID: $\|Name: $\|IP Address: $\|metadata: $\|Name:  $\|## Server  ##\|## Server  Name           ##\|## Server  Name                  ##" 
}

