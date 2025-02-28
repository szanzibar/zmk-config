$buildIds = docker ps -aqf "name=act-build"

$buildIds | ForEach-Object {
    Invoke-Expression "docker exec $($_) bash -c ""mkdir -p /artifact; cp -f /tmp/tmp.*/artifacts/* /artifact"""
    Invoke-Expression "docker cp $($_):artifact/. ./artifacts"
}