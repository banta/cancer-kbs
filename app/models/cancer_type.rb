class CancerType < ActiveRecord::Base
  validates :name, :presence => :true
  has_many :cancer_symptoms
end
