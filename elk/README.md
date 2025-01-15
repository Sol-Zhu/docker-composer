初始化volumes目录

```
mkdir {elasticsearch/data,elasticsearch/logs,logstash/data}
chmod -R 777 {elasticsearch/data,elasticsearch/logs,logstash/data}
```

```
docker run -d --name kibana -p 5601:5601 --restart unless-stopped -v ./kibana/config/kibana.yml:/usr/share/kibana/config/kibana.yml kibana:7.3.2
```