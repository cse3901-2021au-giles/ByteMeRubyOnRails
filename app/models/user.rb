class User < ApplicationRecord
    before_create :setColors
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates :first_name, presence: true, length: {maximum:50}
    validates :last_name, presence: true, length: {maximum:50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum:255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    # Returns the hash digest of the given string.
    def self.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    # Returns a random token.
    def self.new_token
      SecureRandom.urlsafe_base64
    end
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
    def forget
      update_attribute(:remember_digest, nil)
    end

    def admin?
        return self.user_type.downcase == "professor" 
    end

    COLOR_OPTIONS = ["#ff7566", "#f7a197", "#faad5a", "#f0800a", "#e1e66c", "#94d415", "#d3ff7a", "#4f8c2e", "#57e674", "#74e8bc",
  "#05f599", "#5fe8d8", "#3e8c83", "#3e768c", "#3ebbed", "#00638a", "#001e8a", "#6b88f2", "#8f6bf2", "#4f2ab5", "#4a08ff",
  "#a408ff", "#c084e3", "#f57fe7", "#ab0598", "#ab0552", "#db3747"]
     def setColors
        colors = User::COLOR_OPTIONS.sample(2)
        while colors[0] == colors[1] do 
          colors = User::COLOR_OPTIONS.sample(2)
        end
        self.color1 = colors[0]
        self.color2 = colors[1]
     end
end
