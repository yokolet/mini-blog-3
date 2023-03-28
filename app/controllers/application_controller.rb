class ApplicationController < ActionController::API
  include GraphqlDevise::SetUserByToken
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protected
  def set_csrf_token
    cookies['CSRF-TOKEN'] = form_authenticity_token
  end
end
