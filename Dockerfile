FROM ubuntu
SHELL ["bash", "-c"]
RUN apt-get update && apt-get install -y wget
RUN latest_version=$(wget -qO- -t1 -T2 "https://api.github.com/repos/Harry-zklcdc/go-proxy-bingai/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/"//g;s/,//g;s/ //g') \
    && url="https://github.com/Harry-zklcdc/go-proxy-bingai/releases/download/${latest_version}/go-proxy-bingai-linux-amd64.tar.gz" \
    && wget "$url"
RUN chmod +x go-proxy-bingai-linux-amd64.tar.gz
RUN tar -zxvf go-proxy-bingai-linux-amd64.tar.gz
RUN chmod +x go-proxy-bingai
ENTRYPOINT ./go-proxy-bingai
