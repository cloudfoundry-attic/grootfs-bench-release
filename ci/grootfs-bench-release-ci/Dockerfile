FROM cloudfoundry/golang-ci
MAINTAINER https://github.com/cloudfoundry/grootfs-bench-release

# Install BOSH
RUN apt-get update && \
			apt-get -y install git unzip ruby ruby-dev \
					libxml2-dev libxslt-dev libcurl4-openssl-dev \
					build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
RUN gem install bundler bosh_cli --no-rdoc --no-ri

# Install glide
RUN go get github.com/Masterminds/glide
