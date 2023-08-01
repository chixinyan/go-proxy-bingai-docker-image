FROM ubuntu
SHELL ["bash", "-c"]
RUN apt-get update && apt-get install -y curl
RUN curl -s https://api.github.com/repos/Harry-zklcdc/go-proxy-bingai/releases/latest | sed -n 's/.*"browser_download_url": "([^"]go-proxy-bingai-linux-amd32.tar.gz)"./\1/p' | xargs curl -LJO
RUN chmod +x go-proxy-bingai-linux-amd64.tar.gz
RUN tar -zxvf go-proxy-bingai-linux-amd64.tar.gz
RUN chmod +x go-proxy-bingai
ENTRYPOINT ./go-proxy-bingai
