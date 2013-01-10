class ApplicationController < ActionController::Base
  protect_from_forgery
	layout :resolve_layout


  private

  def resolve_layout
    case action_name
    when "lpa"
      "lpa"
    when "lds"
      "lds"
    when "sda"
      "sda"
    when "ninja"
      "ninja"
    when "tasks"
      "tasks"
    else
      "application"
    end
  end

end
