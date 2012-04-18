  class User < ActiveRecord::Base
	has_many :owned_resources, :foreign_key => :user_id, :class_name => "Resource"
	has_many :announcements
	has_many :owned_projects, :foreign_key => :owner_id, :class_name => "Project"
  has_many :contributions
  has_many :projects, :through => :contributions

# validates associated is crashing app, commenting out for now - Matthew
 #  validates_associated :resources, :announcements, :owned_projects, :projects

  #Authentication Code Begin
  attr_accessible :email, :full_name, :pref_name, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  #Authentication Code End
  
	validates_presence_of :email, :full_name, :pref_name
  #validates_inclusion_of :admin, :in => [0, 1]

  validates_uniqueness_of :email, :case_sensitive => false
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, :with => email_regex

  validates_length_of :full_name, :minimum => 3, :allow_nil => false, :allow_blank => false
  validates_format_of :full_name, :with => /^[\sa-zA-Z]{3,}$/i
  
  scope :administrator, where(:admin => true)


  def name
    pref_name || full_name
  end

  def notifications
    return Contribution.where("status > 0").count
    #return 10
  end
  
  def adminuser
    return user.where(:admin => true)
    #return 10
  end

  def send_password_reset
    generate_token(:password_reset_token)
    # set it to expire in three hours
    self.password_reset_expired_at = 3.hours.from_now
    save!
    UserMailer.password_reset(self).deliver
  end

  def password_reset_expired?
    self.password_reset_expired_at && self.password_reset_expired_at < Time.now
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
