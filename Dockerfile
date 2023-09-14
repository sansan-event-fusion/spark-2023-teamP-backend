FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs yarnpkg
RUN ln -s /usr/bin/yarnpkg /usr/bin/yarn
RUN mkdir /app
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . /app

RUN chmod +x setup.sh
CMD /app/setup.sh
EXPOSE 3000