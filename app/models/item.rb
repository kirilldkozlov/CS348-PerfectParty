class Item < ApplicationRecord
  enum type: %i[decor menu ent]
end
