require_relative './menu_display'
require_relative './options'

class PromptUser
  def self.prompt_user(app)
    MenuDisplay.new.menu

    choice = gets.chomp.to_i
    choice == 7 ? app.quit_app : Options.option_case(choice, app)

    prompt_user(app)
  end
end
