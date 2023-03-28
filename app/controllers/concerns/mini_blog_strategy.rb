class MiniBlogStrategy
  def initialize(controller)
    @controller = controller
  end

  def handle_unverified_request
    query_string = JSON.parse(@controller.request.body.string)["query"]
    operationName = GraphQL.parse(query_string).definitions[0].selections[0].name
    if %(users posts postCreate).include?(operationName)
      exception.handle_unverified_request
    else
      reset_session.handle_unverified_request
    end
  end

  private

  def reset_session
    ActionController::RequestForgeryProtection::ProtectionMethods::ResetSession.new(@controller)
  end

  def exception
    ActionController::RequestForgeryProtection::ProtectionMethods::Exception.new(@controller)
  end
end
