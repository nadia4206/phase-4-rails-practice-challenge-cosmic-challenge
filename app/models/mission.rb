class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, :scientist, :planet, presence: true
  validates :scientist_id, uniqueness: { scope: :name, message: "A scientist cannot join the same mission twice" }

end
