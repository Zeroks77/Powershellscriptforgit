Write-Host "Do you want to set or unset the Proxy for git?";
$Qm = Read-Host "If ysou want to unset the Proxy for git type u if you want to set type s"
if($Qm -eq "u"){
git config --global --replace-all http.proxy ?
git config --global --replace-all https.proxy ?
git config --global --unset http.proxy
git config --global --unset https.proxy
}
$h = 
$PORT = "8080" 
if($Qm -eq "s"){
$Proxy = Read-Host "Do you want to set a new Proxy? Y/N"
if($Proxy -eq "Y"){
$h = Read-Host -prompt "Type in the Host"
$PORT = Read-Host "Type in the Port"
git config --global http.proxy  http://$h":"$PORT
git config --global https.proxy  http://$h":"$PORT
}else {
git config --global http.proxy  http://$h":"$PORT
git config --global https.proxy  http://$h":"$PORT
}
}
