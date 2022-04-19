echo off
echo "Downloading zipkin-server"
Invoke-Webrequest https://search.maven.org/remote_content?g=io.zipkin`&a=zipkin-server`&v=LATEST`&c=exec -Outfile zipkin-server.jar
echo "Done"



