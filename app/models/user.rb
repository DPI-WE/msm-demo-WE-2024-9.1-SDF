# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  github_access_token    :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  unconfirmed_email      :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # TODO: add :confirmable back when email is configured
  devise :database_authenticatable,
         :recoverable,
         :registerable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i[github]

  has_many :submitted_movies, foreign_key: "submitter_id", class_name: "Movie"

  has_one_attached :avatar

  after_create_commit :send_welcome_email

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_later
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      # TODO: handle validations
      user.username = auth.info.nickname

      # TODO: avatar_url = auth.info.image
      file = URI.open(auth.info.image)
      user.avatar.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')

      user.password = Devise.friendly_token[0, 20]
      user.github_access_token = auth.credentials.token
    end
  end
end
