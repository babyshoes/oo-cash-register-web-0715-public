require 'pry'
class CashRegister
  attr_reader :discount, :items_list, :prices_list
  attr_accessor :total


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items_list = []
    @prices_list = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times { @items_list << title }
    quantity.times { @prices_list << price }
  end

  def apply_discount
    # binding.pry
    if @discount==0
      "There is no discount to apply." 
    else
      @total *= (100-@discount.to_f)/100
      @total = @total.round
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items_list
  end

  def void_last_transaction
    @total -= @prices_list.pop
  end

end