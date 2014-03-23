class Notifications < ActionMailer::Base
  default from: "cafe@harnwell.upenn.edu"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_item.subject
  #
  def new_item(item)
    @greeting = "Hello!"
    @id = item.id
    @item_adder = item.user.name

    mail to: item.user.email
  end

  def new_user(user)
    @greeting = "Hello!"
    @id = user.id
    @user_added = user.name

    mail to: user.email
  end
end
