# debug api in console

1. 登录
~~~ruby
ApplicationController.allow_forgery_protection = false
login: app.post '/api/v1/users/sign_in', params: {user: {mobile: '13701833013', password: 'abc123'}}
app.session
app.controller.current_user
app.controller.class
app.response.body
app.response.status
~~~