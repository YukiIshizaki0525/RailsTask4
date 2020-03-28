class Item < ApplicationRecord
  # Itemは一人のuserに紐づいているためbelongs_toを用いる
  belongs_to :user
end
