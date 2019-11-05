class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  belongs_to :user
  # enum status: { "未着手": 0, "着手中": 1, "完了": 2}
  # enum priority: { "高": 0, "中": 1, "低": 2 }
  enum status: { notyet: 0, working: 1, completed: 2}
  enum priority: { high: 0, medium: 1, low: 2}
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings

  # scope :search_name, -> (params) { where("name LIKE ?", "%#{params[:name]}%")}
  # scope :search_status, -> (params) { where("status::text LIKE ?", "%#{params[:status]}%")}
  # scope :search_name_and_status, -> (params) { where("name LIKE ?", "%#{params[:name]}%").where("status::text LIKE ?", "%#{params[:status]}%") }
  # scope :search_status, -> (params) { where("label_id::text LIKE ?", "%#{params[:label_id]}%")}

  scope :task, -> (params) {where('(name LIKE ?) AND (status::text LIKE ?)',
  "%#{params[:name]}%",
  "%#{params[:status]}%"
  )}
end
