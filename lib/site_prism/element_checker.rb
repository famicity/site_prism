# frozen_string_literal: true

module SitePrism
  module ElementChecker
    def all_there?
      elements_to_check.all? { |element| there?(element) }
    end

    def elements_present
      mapped_items.select { |item_name| there?(item_name) }
    end

    private

    def elements_to_check
      if self.class.expected_items
        mapped_items.select { |el| self.class.expected_items.include?(el) }
      else
        mapped_items
      end
    end

    def mapped_items
      return unless self.class.mapped_items

      self.class.mapped_items.uniq
    end

    def there?(element)
      send("has_#{element}?")
    end
  end
end
