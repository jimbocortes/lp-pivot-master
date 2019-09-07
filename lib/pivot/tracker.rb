module Pivot
  class Tracker
    # Code here!

    def self.count(items)
      items.count
    end
    
    def self.item_for(items, email)
      items.inject do |res, item|
        if item[:assignee] == email
          res = item 
        end
        res
      end
    end
    
    def self.pivoted?(items, email)
      is_pivoted = items.find do |item|
        item[:assignee] == email
      end
      !is_pivoted.nil?
    end
  
    def self.total_points(items, options={}) 
      if options[:assignee]
        total = items.inject(0) do |sum, item|
          if item[:assignee] == options[:assignee]
            sum += item[:points]
          end
          sum
        end
        return total
      end

      assignee_items = []

      unique_assignees(items).each do |assignee| 
        assignee_items.push(item_for(items, assignee))
      end
      
      total = assignee_items.inject(0) do |sum, item|
        sum += item[:points]
      end
    end

    def self.unique_assignees(items)
      assignees = items.map do |item|
        item[:assignee]
      end
      
      assignees.uniq
    end
  
  end 
end


