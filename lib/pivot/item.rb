module Pivot
  class Item
    attr_reader :name, :assignee, :points

    def initialize(attributes={})
      @name = attributes[:name]
      @assignee = attributes[:assignee]
      @points = attributes[:points]
    end

    def +(item)
      self.points + item.points
    end

    def project_code
      regex_res = self.name.match(/\w+/)
      regex_res ? regex_res[0] : nil
    end

    def valid?
       valid_codes.include? project_code
    end

    private
    
    def valid_codes
      %w(EREC AZR)
    end
  end
end