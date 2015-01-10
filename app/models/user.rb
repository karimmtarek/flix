class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true,
                       uniqueness: {case_sensitive: false},
                       format: {with: /\A[A-Z0-9]+\z/i, message: 'can only consist of letters and numbers.'}
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    format: /\A\S+@\S+\z/
  validates :password, length: { minimum: 8, allow_blank: true }

  def member_since
    created_at.strftime('%B %Y')
  end

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end
end
