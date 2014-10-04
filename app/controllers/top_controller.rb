# coding: utf-8
class TopController < BaseController
  skip_before_filter :verify_authenticity_token, only: [:create_user]

  def index
  end
end
