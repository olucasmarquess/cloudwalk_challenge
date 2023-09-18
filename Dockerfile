FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /quaker_parser
WORKDIR /quaker_parser

COPY Gemfile /quaker_parser/Gemfile
COPY Gemfile.lock /quaker_parser/Gemfile.lock
RUN bundle install

COPY . /quaker_parser

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3010

CMD ["rails", "server", "-b", "0.0.0.0"]
