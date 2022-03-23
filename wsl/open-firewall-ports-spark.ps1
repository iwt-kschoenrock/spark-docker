$ports = 2222,7077,8080,8081,8082,8083
$ports_list = $ports -join ','
netsh advfirewall firewall add rule name='WSL port forwarding for Spark' dir=in action=allow protocol=TCP localport=$ports_list