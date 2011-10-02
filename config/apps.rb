Padrino.configure_apps do
  enable :sessions

  set :session_secret, 'd4675f3c948969ba62ab3401dc2a5ff5ce81427e2497830b18805e788af09ff7'
end

Padrino.mount("Nope").to('/')
