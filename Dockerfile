From ubuntu:latest

RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

RUN apt update;\
    apt-get install python3 curl python3-distutils language-pack-zh-han* -y ;\
    locale-gen ;\
    ln -s /usr/bin/python3 /usr/bin/python;\
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py;\
    python /tmp/get-pip.py -i https://pypi.tuna.tsinghua.edu.cn/simple;\
    ln -s /usr/bin/pip3 /usr/bin/pip;\
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple;\
    mkdir /app

WORKDIR /app


CMD ["python"]   
