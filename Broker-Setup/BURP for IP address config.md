IP address for Broker changes everytime Debian app is started so to take care of this problem, BURP community edition is a useful tool for configuring IP address proxies.<br>

The general idea is to configure Burp as an "invisible" Proxy. By default, the software is an HTTP proxy that you have to configure in your browser. But you can configure burp so that it will forward every request to a specific webserver, in your case the broker. Then you can point your application to the address and port of burp, burp will intercept and log each request, and then forward it to the actual host.<br>

[1] Setting a single host as target: cf. section "Request handling" in https://portswigger.net/burp/documentation/desktop/tools/proxy/options<br>
[2] On invisible proxies: https://portswigger.net/burp/documentation/desktop/tools/proxy/options/invisible<br>
So for your example, if you broker listens on localhost:9000, you configure burp to listen on, for example, port 8080 and set the "redicrect to host" to localhost and "redirect to port" on port 9000. <br>
Then, in your application, instead of sending your requests to http://localhost:9000/ngsi-ld/v2/something you use http://localhost:8080/ngsli-ld/v2/something<br>

See the screenshot BurpConfig.jpg for more details.<br>