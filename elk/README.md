初始化volumes目录

```
mkdir {elasticsearch/data,elasticsearch/logs,logstash/data}
chmod -R 777 {elasticsearch/data,elasticsearch/logs,logstash/data}
```

```
docker run -d \
--name kibana \
-p 5601:5601 \
--restart unless-stopped \
-v ./kibana/config/kibana.yml:/usr/share/kibana/config/kibana.yml \
kibana:7.3.2
```

```
docker run -d \
--name elasticsearch \
-p 9200:9200 \
-p 9300:9300 \
--restart unless-stopped \
-v ./elasticsearch/data:/usr/share/elasticsearch/data \
-v ./elasticsearch/logs:/usr/share/elasticsearch/logs \
-v ./elasticsearch/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
-v ./elasticsearch/config/jvm.options:/usr/share/elasticsearch/config/jvm.options \
-e cluster.name=elasticsearch \
-e discovery.type=single-node \
-e TZ=Asia/Shanghai \
-e LANG=en_US.UTF-8 \
-e TAKE_FILE_OWNERSHIP="true" \
-e ELASTIC_PASSWORD="123456" \
elasticsearch:7.3.2
```

```
docker run -d \
--name logstash \
-p 4560:4560 \
-p 5044:5044 \
-p 9600:9600 \
-p 10001-10010:10001-10010 \
--restart unless-stopped \
-v /usr/share/docker/logstash/data:/usr/share/logstash/data \
-v /usr/share/docker/logstash/config/logstash.yml:/usr/share/logstash/config/logstash.yml \
-v /usr/share/docker/logstash/pipeline:/usr/share/logstash/pipeline \
-v /usr/share/docker/logstash/config/jvm.options:/usr/share/logstash/config/jvm.options \
logstash:7.3.2
```