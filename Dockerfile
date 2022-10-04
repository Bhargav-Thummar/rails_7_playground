FROM ruby:3.0.0

ADD . /Projects/Self/Rails/rails_7_playground
WORKDIR /Projects/Self/Rails/rails_7_playground
RUN bundle install

ENV RAILS_ENV development
ENV RAILS_SERVE_STATIC_FILES true

ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_USER=Thummar_PG1.

EXPOSE 3000
CMD ["bash"]