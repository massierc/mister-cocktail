class Ingredient < ActiveRecord::Base
  has_many :doses

  validates :name, presence: true, uniqueness: true

  before_destroy :allow_destroy

  def allow_destroy
  end
end
