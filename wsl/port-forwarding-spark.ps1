# configure port forwarding for all ports in the list below
$ports = 2222,7077,8080,8081,8082,8083
ForEach ($listen_port in $ports) {
    $wsl_ip = wsl.exe -d Ubuntu -e sh -c "ip addr show eth0 | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1"
    $found = $wsl_ip -match '(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})';
    Write-Host $listen_port
    $wsl_ip = $matches[0];
    iex "netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=$listen_port"
    iex "netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=$listen_port connectaddress=$wsl_ip connectport=$listen_port"
    iex "netsh advfirewall firewall add rule name='open port $listen_port for wsl2 port fowarding' dir=in action=allow protocol=TCP localport=$listen_port"
}