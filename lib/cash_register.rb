
class CashRegister

    attr_accessor :total, :items, :last_transaction
    attr_reader :discount


    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        @items.fill(title, @items.size, quantity)
        @last_transaction = [title, price, quantity]
    end

    def apply_discount
        if !!discount
            self.total = self.total - (self.total * ((discount).to_f/100).to_f)
            return "After the discount, the total comes to $#{total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        return @items
    end

    def void_last_transaction
        @total = @total - (@last_transaction[1] * @last_transaction[2])

    end

end