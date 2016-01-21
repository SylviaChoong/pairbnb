require 'elasticsearch/model'
class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	mount_uploaders :avatars, AvatarUploader
	searchkick
end