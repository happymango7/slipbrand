class Category < ApplicationRecord
	has_many :influencers

	validates :name, presence: true

	def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end 

  default_scope -> { order('categories.created_at DESC') }

  	# attachments
	has_attached_file :image,
     :storage => "s3",
     :s3_credentials => { 
          :bucket => :brandslip_assets, 
          :access_key_id => ENV["AWS_ACCESS_KEY_ID"], 
          :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
      },
      :url => ":s3_domain_url",
      :s3_protocol => :https,
      :path => "/:class/:attachment/:id_partition/:style/:filename",
      :styles => { :small => "300x300^"}

      validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
