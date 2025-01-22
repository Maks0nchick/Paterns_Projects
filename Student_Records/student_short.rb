require_relative 'person'

class Student_short < Person

  attr_reader :initials, :contact

  def self.create_about_student(student)
    new(id: student.id, git: student.git, initials: student.initials, contact: student.contact)
  end  

  def self.from_sting(id:,string:)
    initials, contact, git= read_info_from_string(string)
    new(id: id, initials:initials, contact:contact, git:git)
  end
  
  def  self.read_info_from_string(string)
    initials,contact,git = string.split(', ')
    return initials,contact,git
  end  
  
  def to_s
    "\nID: #{@id} \nInitials: #{@initials} \nGit: #{@git} \nContact: #{@contact}"
  end
 
  def has_contact?
    !@contact.nil?
  end

  private_class_method :new

    def initialize(id: nil, initials:nil , git: nil, contact: nil)
      super(id: id, git: git)
      @initials = initials
      @contact = contact
    end 
end  