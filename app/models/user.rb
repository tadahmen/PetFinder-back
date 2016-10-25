class User < ApplicationRecord
  has_one :owner
  # has_one :finder
end
