FROM registry.cn-hangzhou.aliyuncs.com/jcloud_s/3.5.3-jdk-8-alpine

# 当前项目名称
ENV PROJECTNAME demo1
###设置docker时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV LC_ALL zh_CN.utf8

# 设定工作路径,如果不存在会创建
WORKDIR /usr/jcloud/$PROJECTNAME
#copy当前执行文件至工作路径
RUN pwd
CMD ["mvn","clean package -Dmaven.test.skip=true"]
COPY ./target/*  /usr/jcloud/$PROJECTNAME/
# docker 启动命令 如果此命令退出则docker退出
ENTRYPOINT java -jar /usr/jcloud/$PROJECTNAME/$PROJECTNAME.jar

