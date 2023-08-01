FROM ubuntu
SHELL ["bash", "-c"]
RUN apt-get update && apt-get install -y curl jq
RUN curl -s https://api.github.com/repos/Harry-zklcdc/go-proxy-bingai/releases/latest | jq -r '.assets[] | select(.name == "go-proxy-bingai-linux-amd64.tar.gz") | .browser_download_url' | xargs curl -L -o go-proxy-bingai-linux-amd64.tar.gz
RUN chmod +x go-proxy-bingai-linux-amd64.tar.gz
RUN tar -zxvf go-proxy-bingai-linux-amd64.tar.gz
RUN chmod +x go-proxy-bingai
ENTRYPOINT ./go-proxy-bingai
