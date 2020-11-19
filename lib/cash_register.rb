require 'pry'
class CashRegister
    attr_reader :discount
    attr_accessor :total

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @all_items = []
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        item = {:title => title, :price => price, :quantity => quantity}
        @all_items << item
    end

    def apply_discount
        if discount == 0
            return "There is no discount to apply."
        end

        @total -= (@total * (@discount.to_f / 100)).to_i
        "After the discount, the total comes to $#{@total}."
    end

    def items 
        result = []
        @all_items.each {|items| items[:quantity].times {result << items[:title]} }
        result
    end

    def void_last_transaction
        if @all_items.length == 1
            @total = 0.0
        else 
            @total -= @all_items[@all_items.length-1][:price]
        end
        @all_items.pop
    end

end
