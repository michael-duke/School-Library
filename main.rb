require_relative './app'
require_relative './prompt_user'

def main
  puts "\n👋 Welcome to School Library App!"
  app = App.new
  PromptUser.prompt_user(app)
end

main
