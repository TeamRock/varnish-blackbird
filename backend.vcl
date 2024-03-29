vcl 4.0;

backend default {
        .host = "blackbird";
        .port = "80";
        .probe = {
                .url = "/health-check";
                .timeout = 90ms;
                .interval = 10s;
                .window = 3;
                .threshold = 2;
        }
}

sub vcl_recv {
   if (req.http.host ~ "blackbird\.teamrock\.com") {
     return (pass);
   }
}

