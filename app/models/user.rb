class User < ApplicationRecord
  enum role: [:standard, :premium, :admin]
  after_initialize { self.role ||= :standard }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy
  has_many :collaborators
  has_many :wikis, through: :collaborators

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  # Turned off mailer due to Sendgrid hating me
  # after_create :new_user
  #
  # def new_user
  #   UserMailer.new_user(self).deliver_now
  # end
end
