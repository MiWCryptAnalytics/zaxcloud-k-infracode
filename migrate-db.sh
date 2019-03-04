export MASTODON_POD=$(kubectl get pods -n mastodon -l app=mastodon-web -o jsonpath='{.items[0].metadata.name}')
kubectl exec -n mastodon  $MASTODON_POD  -i -t -- bash -il
$ RAILS_ENV=production bundle exec rails db:migrate