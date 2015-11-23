backend default {
        .host = "blackbird";
        .port = "6601";
        .probe = {
                .url = "/health-check";
                .timeout = 90ms;
                .interval = 10s;
                .window = 3;
                .threshold = 2;
        }
}

sub vcl_fetch {
  set beresp.ttl = 180s;
}

