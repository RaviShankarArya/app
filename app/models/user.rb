class User < ActiveRecord::Base
  has_secure_password

  validates :first_name,
            :presence => true,
            :length =>{ :minimum => 3, :maximum => 12 },
            :format => { :with => ConfigCenter::User::FIRST_NAME_REG_EXP,
                         :message => 'Invalid first name format',
                         :if => proc { |user| user.first_name.present? } }

  validates :last_name,
            :presence => true,
            :length =>{ :minimum => 3, :maximum => 12 },
            :format => { :with => ConfigCenter::User::LAST_NAME_REG_EXP,
                         :message => 'Invalid last name format',
                         :if => proc { |user| user.last_name.present? } }

  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => { :with => ConfigCenter::User::EMAIL_FORMAT_REG_EXP,
                         :if => proc { |user| user.email.present? } }

  validates :password,
            :presence => true,
            :format => { :with => ConfigCenter::User::PASSWORD_FORMAT_REG_EXP,
                         :message => 'invalid password format',
                         :if => proc { |user| user.password.present? } }

  validates :password_confirmation,
            :presence => true,
            :if => proc { |user| user.password.present? }

  validates :phone,
            :presence => true,
            :format => { :with => ConfigCenter::User::PHONE_FORMAT_REG_EXP,
                         :if => proc { |user| user.phone.present? } }
end
