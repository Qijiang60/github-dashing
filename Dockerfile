FROM frvi/dashing

MAINTAINER Roman Tarnavski

RUN apt-get update && apt-get install -y git curl

ADD . /dash

WORKDIR /dash

RUN bundle install

ENV DASHBOARD_HEADING "Dash-o"

RUN sed -i -e "s|<h1.*$|<h1 class=\"header\">$DASHBOARD_HEADING</h1>|g" dashboards/default.erb

CMD ["dashing", "start"]