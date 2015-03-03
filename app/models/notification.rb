# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  item_id      :integer
#  item_type    :integer
#  message      :integer
#  message_type :integer
#

class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, polymorphic: true

  after_create :send_notification

  def send_notification
    if ( notification_type == :agency && user.agency_notifications_emails ) ||
        ( notification_type == :contact && user.contact_notifiations_emails )  
      NotificationMailer.email(self).deliver_later
    end
  end
  
end
