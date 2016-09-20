FROM jpetazzo/dind
MAINTAINER EngineerBetter <contact@engineerbetter.com>

RUN wrapdocker

# Here we'd create a container based of the image provided by Concourse input
RUN docker create --name wip --privileged engineerbetter/bosh-lite-spiff /usr/bin/start-bosh

# Here we'd copy in the Git repo provided by Concourse input
RUN git clone https://github.com/cloudfoundry/cf-release.git
RUN docker cp cf-release|- wip:/tmp/cf-release