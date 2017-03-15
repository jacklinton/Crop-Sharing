class Item < ApplicationRecord
    belongs_to :event
    has_one: user
end
