class MessagesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :content, :user_id, :message_code, :status
end