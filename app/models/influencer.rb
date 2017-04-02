class Influencer < ApplicationRecord
	include AlgoliaSearch
	require 'open-uri'  
	include ActionView::Helpers::NumberHelper

	before_save :get_instagram_data
	before_save :get_youtube_data
	before_save :get_twitter_data 

	belongs_to :category 

	validates :name, presence: true 
	validates :category_id, presence: true
	validates :email, presence: true
	validates :gender, presence: true 

	has_many :placements
  	has_many :campaigns, through: :placements
  	has_many :messages, :through => :campaigns

  	# Influencer Tags
  	has_many :taggings
	has_many :tags, through: :taggings

	# attachments
	has_attached_file :avatar,
     :storage => "s3",
     :s3_credentials => { 
          :bucket => :brandslip_assets,
          :access_key_id => ENV["AWS_ACCESS_KEY_ID"], 
          :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
      },
      :url => ":s3_domain_url",
      :s3_protocol => :https,
      :path => "/:class/:attachment/:id_partition/:style/:filename",
      :styles => { :small => "150x150^"}

      validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    # Algolia Search stuff
   
    algoliasearch per_environment: true do
    	attribute :name, :description, :email, :location, :international, :category, :multicultural, :approved, :gender, :email, :instagram_follower_count, :twitter_follower_count, :youtube_subscribers_count 

    	attribute :avatar do
           self.avatar.url(:small)
        end

        attribute :instagram_followers do
        	number_to_human(self.instagram_follower_count, precision: 1)
        end

        attribute :twitter_followers do
        	number_to_human(self.twitter_follower_count, precision: 1)
        end

        attribute :youtube_subscribers do
        	number_to_human(self.youtube_subscribers_count, precision: 1) 
        end

        attributesForFaceting [:location, :category, :multicultural, :international, :youtube_subscribers_count, :instagram_follower_count, :twitter_follower_count]
  	end

	def all_tags=(names)
	  self.tags = names.split(",").map do |name|
	      Tag.where(name: name.strip).first_or_create!
	  end
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
  		Tag.find_by_name!(name).influencers
	end

	private 

	def get_instagram_data
		if self.instagram_username?
			username = self.instagram_username.downcase
			user_response = RubyInstagramScraper.search( username )

			user = user_response["users"].select { |user| user["user"]["username"] == username }
			self.avatar = user[0]["user"]["profile_pic_url"]
			self.instagram_follower_count = user[0]["user"]["follower_count"]
		end
	end

	def get_youtube_data
		if self.youtube_username? 
			channel = Yt::Channel.new url: self.youtube_username
			self.youtube_subscribers_count = channel.subscriber_count
		end
	end

	def get_twitter_data
		if self.twitter_username?
			self.twitter_follower_count = $twitter.user(self.twitter_username).followers_count
		end
	end
end
