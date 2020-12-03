module UsersHelper
  def error_validator(user)
    return unless user.errors.any?

    list = "<ul class='has-text-danger'>"
    user.errors.full_messages.each do |message|
      list += "<li class='has-text-danger'>#{message}</li>"
    end
    list += '</ul>'
    list.html_safe
  end
end
