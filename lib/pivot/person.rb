module Pivot
  class Person
    attr_reader :email, :first_name, :last_name, :items

    def initialize(attributes={})
      @email = attributes[:email]
      @first_name = attributes[:first_name]
      @last_name = attributes[:last_name]
      @items = []
    end

    def add_item(item, &block)
      @items.push(item)
      item.assignee = email
      block.call if block_given?
      item
    end 

  end
end