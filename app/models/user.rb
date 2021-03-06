require 'openssl'

class User < ApplicationRecord

  attr_accessor :password

  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  ##Relations
  has_many :questions

  ##Validates
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :password, presence: true, on: :create
  validates_confirmation_of :password
  validates_format_of :email, with: /@/
  validates_format_of :username, with: /\A[a-zA-Z0-9_]+\z/
  validates_length_of :username, maximum: 40

  ##Callbacks
  before_save :encrypt_password
  before_validation { self.username.downcase! }

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
end

