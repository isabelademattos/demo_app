class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
	#has_many :locals, dependent: :destroy


  	#attr_accessible :local_attributes
  	has_many :locals
	#has_many :locals, dependent: :destroy, inverse_of: :user
	accepts_nested_attributes_for :locals, reject_if: :all_blank, allow_destroy: true
	#accepts_nested_attributes_for :locals, :reject_if => :all_blank, :allow_destroy => true

	validates :name, presence: true, length: { minimum: 1 }

    scope :recents, -> { order('created_at DESC').limit(5) }
    scope :filter_by_name, -> (param = '') { where('name LIKE ?', "%#{param}%") } 
    scope :filter_by_initial_date, ->(start = Date.today.beginning_of_month) { where("created_at >= ?", start) } 
    scope :filter_by_final_date, ->(final = Date.today.end_of_month) { where("created_at <= ?", final) } 
end
