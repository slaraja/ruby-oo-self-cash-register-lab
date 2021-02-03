class CashRegister
    attr_accessor :total, :discount, :cart, :price, :prices, :quantity

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @cart = []
        @prices = []
    end

    def add_item(item, price, quantity=1)
        @quantity = quantity
        @total += (price*quantity)
        x=0
        while quantity > x do
            @prices.push(price)
            @cart.push(item)
            x += 1
        end
    end

    def apply_discount
        if @discount != nil
            @total = total - (@discount*10) 
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        return @cart
    end

    def void_last_transaction
        x = 0
        while @quantity > x do    
            @cart.pop
            @total -= @prices[-1]
            x += 1
        end
    end
end