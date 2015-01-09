# ELK Demo

[ELK Stack] is combination of three great softwares that are [Elasticsearch], [Logstash], and [Kibana] that form end-to-end solution for logging infrastructure. Elasticsearch serves to index log data. Logstash serves to parse, transform, and transport log data. While Kibana serves to provide slick dashboard. ELK Stack is open source and state of the art of host your own logging solution. This demo repository is responsible to create demo architecture as follow:  
<!-- language: lang-none -->
    -----------          ----------
    | Gitlist |          | Kibana |
    -----------          ----------
         |                   ^
         v                   |
    -----------       -----------------
    | Logstash | ---> | Elasticsearch | 
    -----------       -----------------
## Quickstart
1. [Install Docker]
2. [Install Fig]
3. Clone this repo, `git clone https://github.com/GDP-ADMIN/elk-demo`
4. Run Fig, `cd elk-demo && fig up`. (It takes sometime for this command to finish at first run)
5. Visit Gitlist at http://localhost/
6. Visit Kibana at http://localhost:8080/ and use __elk-demo__ as username and password

## Demo Walkthrough
[Gitlist] is web based application to view and browser Git repository. This application is built with PHP. In this demo, gitlist will be deployed on top of Nginx and PHP5-FPM. Nginx log, created when accessing gitlist, will be read, transformed, and transported to Elasticsearch by Logstash. User will use Kibana to query and visualize log data they are interested to. Kibana is also serve as gateway to limit user interaction with Elasticsearch. You may be asked yourself why do we involve PHP application if we are only going to read nginx log. The answer is we need to calculate request time which is time nginx takes to process an incoming client request. Most of the time, nginx will report 0 request time when serving static file. Another reason is Nginx and FPM are current goto combination for web application.

[ELK Stack]: http://www.elasticsearch.com/
[Elasticsearch]: http://www.elasticsearch.com/products/elasticsearch/
[Logstash]: http://www.elasticsearch.com/products/logstash/
[Kibana]: http://www.elasticsearch.com/products/kibana/
[Gitlist]: https://github.com/klaussilveira/gitlist
[Install Docker]: https://docs.docker.com/installation/
[Install Fig]: http://www.fig.sh/install.html
