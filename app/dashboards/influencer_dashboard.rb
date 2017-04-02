require "administrate/base_dashboard"

class InfluencerDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    category: Field::BelongsTo,
    placements: Field::HasMany, 
    campaigns: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::String, 
    facebook_username: Field::String,
    instagram_username: Field::String,
    twitter_username: Field::String,
    youtube_username: Field::String,
    linkedin_username: Field::String,
    snapchat_username: Field::String,
    email: Field::String,
    location: Field::String,
    gender: Field::String,
    multicultural: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime, 
    featured: Field::Boolean,
    international: Field::Boolean,
    approved: Field::Boolean,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :name,
    :category,
    :campaigns,
    :approved,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :category,
    :campaigns,
    :id,
    :description,
    :facebook_username,
    :instagram_username,
    :twitter_username,
    :youtube_username,
    :linkedin_username,
    :snapchat_username,
    :email,
    :location,
    :gender,
    :multicultural,
    :created_at,
    :updated_at,
    :featured,
    :international,
    :approved,
  ].freeze

  FORM_ATTRIBUTES = [
    :category,
    :name,
    :description,
    :facebook_username,
    :instagram_username,
    :twitter_username,
    :youtube_username,
    :linkedin_username,
    :snapchat_username,
    :email,
    :location,
    :gender,
    :multicultural,
    :featured,
    :international,
    :approved,
  ].freeze  
end
