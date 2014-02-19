class AdResult < ActiveRecord::Base

  validates_presence_of :result_group
  validates_presence_of :ad

  belongs_to :result_group
  belongs_to :ad

end
