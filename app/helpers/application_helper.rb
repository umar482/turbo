module ApplicationHelper
  def app?
    request.user_agent.include?('Turbo Native iOS')
  end
end
