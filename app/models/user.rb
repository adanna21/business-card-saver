class User < ApplicationRecord
    PASSWORD_LENGTH = (6..25)
    USERNAME_LENGTH = (5..15)

    has_many :contacts, dependent: :delete_all

    validates_presence_of :username
    validates :name, presence: true
    validates :username, length: USERNAME_LENGTH, uniqueness: true
    validates :password, length: PASSWORD_LENGTH, allow_nil: true
    validates :email, confirmation: true,
    presence: true,
    uniqueness: true,
    format: {
      with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
      message: "Thats not an email!"
    },
    length: {
      minimum: 5
    }
    validates :email_confirmation, presence: true
   

    attr_reader :password

    def self.find_from_credentials(username, password)
        user = find_by(username: username)
        return nil unless user
        user if user.is_password?(password)
    end

    def is_password?(password_attempt)
        BCrypt::Password.new(password_digest).is_password?(password_attempt)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
end
