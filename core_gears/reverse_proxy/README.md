# REVERSE PROXY

add hosts in <code>host_list.json</code>

such as

```json
[
  {
    "server_name": "testa.ynuosa.org",
    "listen": "80",
    "proxy_pass": "http://www.ynu.edu.cn"
  },

  {
    "server_name": "testb.ynuosa.org",
    "listen": "80",
    "proxy_pass": "http://113.55.13.72:80"
  }

]
```