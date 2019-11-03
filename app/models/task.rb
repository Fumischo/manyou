class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  belongs_to :user, dependent: :destroy
  # enum status: { "未着手": 0, "着手中": 1, "完了": 2}
  # enum priority: { "高": 0, "中": 1, "低": 2 }
  enum status: { notyet: 0, working: 1, completed: 2}
  enum priority: { high: 0, medium: 1, low: 2}

  scope :search_name, -> (params) { where("name LIKE ?", "%#{params[:name]}%")}
  scope :search_status, -> (params) { where("status::text LIKE ?", "%#{params[:status]}%")}
  scope :search_name_and_status, -> (params) { where("name LIKE ?", "%#{params[:name]}%").where("status::text LIKE ?", "%#{params[:status]}%") }
end