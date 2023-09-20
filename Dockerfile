# Use a specific version of Slim Buster Linux
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  postgresql-client \
  nodejs \
  yarn \
  build-essential patch ruby-dev zlib1g-dev liblzma-dev

# Install Ruby and Bundler
RUN gem update --system \
  && gem install bundler -v "~> 2.0"

# Set working directory
WORKDIR /quaker_parser

# Install Ruby dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Clean and reinstall gems
RUN bundle clean --force
RUN bundle install

# Copy application files
COPY . ./

# Expose port 3000
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]