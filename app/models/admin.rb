class Admin < ActiveRecord::Base
   devise :database_authenticatable, :registerable, :timeoutable, :validatable,
   :lockable
   validates_uniqueness_of :user_name
   
   attr_accessible :user_name, :email, :password_confirmation, :password,
                    :reset_password_token, :unlock_token
#                   :encrypted_password, :password_salt, :sign_in_count, 
#                   :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
#                   :last_sign_in_ip, :failed_attempts, :locked_at,
end
