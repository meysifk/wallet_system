# frozen_string_literal: true

class Entity < ApplicationRecord
  has_one :wallet, dependent: :destroy
end
