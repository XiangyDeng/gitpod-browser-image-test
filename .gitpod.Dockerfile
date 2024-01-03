FROM gitpod/workspace-full-vnc

USER gitpod

## 配置环境
RUN sudo apt-get update && \
    sudo apt-get install -y \
        build-essential \
        curl \
        libasound2-dev \
        libcurl4-openssl-dev \
        libdbus-1-dev \
        libdbus-glib-1-dev \
        libdrm-dev \
        libgtk-3-dev \
        libpulse-dev \
        libpython3-dev \
        libx11-xcb-dev \
        libxt-dev \
        m4 \
        python3 \
        python3-dev \
        python3-pip \
        unzip \
        uuid \
        xvfb \
        zip \
        net-tools \
    && sudo rm -rf /var/lib/apt/lists/*

# linux 系统中文字体安装
RUN sudo apt -y --fix-broken install && \
    sudo apt update && \
    sudo apt install unrar

WORKDIR /usr/share/fronts/truetype
RUN sudo mkdir myfronts && \
   cd myfronts && \
   unrar x /workspace/gitpod-browser-image-test/ch-fronts.rar

RUN sudo chmod 777 /usr/share/fonts/truetype/* && \
   sudo fc-cache -fv

CMD ["google-chrome"]
## 打开浏览器指令
# ctrl + alt + t 打开终端
# 执行 google-chrome
