class Authentication < ActiveRecord::Base
  belongs_to :citizen
  validates_presence_of :citizen
  attr_accessible :provider, :uid, :citizen, :info, :credentials, :extra
end
