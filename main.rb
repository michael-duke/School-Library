require_relative './app'
require_relative './prompt_user'

def main
  puts "\n:wave: Welcome to School Library App!"
  app = App.new
  # app.run
  PromptUser.new.prompt_user(app)
end

main
