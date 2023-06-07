require_relative 'game_ui'

class Main 
    def initialize
        store = Store.new
        store.display_menu
    end
end

main = Main.new