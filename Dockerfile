FROM python:3.7-alpine
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV AWS_ACCESS_KEY_ID ${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY ${AWS_SECRET_ACCESS_KEY}
# Install Nodejs
RUN apk update \
  && apk add --no-cache nodejs npm

# install aws-cli
RUN pip install awscli

# install boto3
RUN pip install boto3

# install serverless framework
RUN npm install -g serverless

# set aws key 
RUN serverless config credentials --provider aws --key AWS_ACCESS_KEY_ID --secret AWS_SECRET_ACCESS_KEY

ENV APP_ROOT /serverless-todo 

# change work directory
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT