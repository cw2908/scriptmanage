resque: env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=7 QUEUE=default rake environment resque:work --trace
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
client: sh -c 'rm -rf public/packs/* || true && bundle exec rake react_on_rails:locale && bin/webpack -w'

