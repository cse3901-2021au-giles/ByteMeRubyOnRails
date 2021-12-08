class User < ApplicationRecord
    has_many :user_class_x_refs, :inverse_of => :user
    has_many :class_sessions, :through => :user_class_x_refs
    has_many :evaluation
    before_create :setColors
    attr_accessor :remember_token
    before_save { self.email = email.downcase 
                  self.first_name = first_name.capitalize
                  self.last_name = last_name.capitalize}
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
    
    def student?
      return self.user_type.downcase == "student"
    end
    
    def getClasses
      xrefs = UserClassXRef.where(user_id: self.id)
      classes = Array.new
      xref_classes = nil
      xrefs.each do |xref|
        xref_classes = ClassSession.where(id: xref.class_session_id).to_a
          xref_classes.each do |xref_class|
            classes.push(xref_class)
          end
      end
      return classes
    end

    def pending_evals_for_group(group)
      evals = Evaluation.where(evaluator_id: id).where(group_id: group.id).where(submitted:false)
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
