FROM ruby:2.6.4-alpine AS build-env

ARG RAILS_ROOT=/app
ENV RAILS_ENV=production
ARG BUILD_PACKAGES="build-base curl curl-dev git bash"
ARG DEV_PACKAGES="postgresql-dev yaml-dev zlib-dev nodejs yarn"
ARG RUBY_PACKAGES="ruby-dev graphviz tzdata"
ENV BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"

WORKDIR $RAILS_ROOT
COPY . .
RUN chgrp -R 0 ./tmp && chmod -R g=u ./tmp

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES \
    # install rubygem
    && bundle install


############### Build step done ###############
FROM ruby:2.6.4-alpine
ARG RAILS_ROOT=/app
ARG PACKAGES="tzdata postgresql-client nodejs bash"
ENV RAILS_ENV=production

WORKDIR $RAILS_ROOT
# install packages
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES
COPY --from=build-env $RAILS_ROOT $RAILS_ROOT
COPY --from=build-env /usr/local/bundle/ /usr/local/bundle/

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["sh","-c","bundle exec puma -C config/puma.rb"]
