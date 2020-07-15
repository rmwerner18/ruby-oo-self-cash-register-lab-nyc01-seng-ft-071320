require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_item
    def initialize(discount=nil) 
        @total = 0
        @discount = discount
        @items = []
    end
    def items
        @items
    end
    def add_item(title, price, quantity=1)
        @items.concat([title]*quantity)
        @total += price * quantity
        @last_item = price * quantity
    end
    def apply_discount
        if discount
            @total = @total * (1 - @discount.to_f/100.00)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        @total = @total - @last_item
    end
end