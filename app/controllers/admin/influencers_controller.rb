module Admin
  class InfluencersController < Admin::ApplicationController

    def index
       super
       @resources = Influencer.all.page(params[:page]).per(150)
     end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Influencer.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
