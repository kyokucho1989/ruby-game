class Character
    attr_reader :name
    attr_accessor :money, :bet_money, :hand, :dices
    def initialize(**params)
      @name = params[:name]
      @money = params[:money]
      @bet_money = params[:bet_money]
      @hand = params[:hand]
      @dices = params[:dices]
    end
end