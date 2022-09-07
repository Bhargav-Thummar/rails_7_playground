FROM ruby:3.0.0

ADD . /dockerize_rails_7_playground
WORKDIR /dockerize_rails_7_playground
RUN bundle install

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

EXPOSE 3000
CMD ["bash"]