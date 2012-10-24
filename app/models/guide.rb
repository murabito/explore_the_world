class Guide < ActiveRecord::Base
	has_many :places

	validates :name, :presence => true
end
