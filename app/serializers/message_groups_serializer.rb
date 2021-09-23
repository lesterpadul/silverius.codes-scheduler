class MessageGroupsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :receiver_id, :message_code, :status
end
