# Phoenixcast

## HOW TO DEPLOY HEROKU

1. Create heroku app following this tutorial http://www.phoenixframework.org/docs/heroku
2. Create this extra Heroku Config Vars before deploy:

```
  heroku config:set SITE_URL="example.herokuapp.com"
  heroku config:set ADMIN_USERNAME="admin"
  heroku config:set ADMIN_PASSWORD="secret"
  heroku config:set YOUTUBE_API_KEY="youtube_api_key"
  heroku config:set ANALYTICS="your_google_analytics_key"
```

## HOW TO MANAGE VIDEOS

Access /admin/videos/
