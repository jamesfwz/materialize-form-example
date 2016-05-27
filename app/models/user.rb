class User < ActiveRecord::Base
  extend Enumerize

  serialize :types,   Array
  serialize :hobbies, Array

  enumerize :gender,  in: [:male, :female]
  enumerize :types,   in: [:student, :tutor],   multiple: true
  enumerize :hobbies, in: [:football, :music],  multiple: true

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :gender,      presence: true
  validates :dob,         presence: true
  validates :is_student,  inclusion: {in: [true, false]}
  validates :private,     inclusion: {in: [true, false]}
  validates :is_tutor,    inclusion: {in: [true, false]}

  has_attached_file :avatar, styles: { thumb: "350x350#" }
  validates_attachment :avatar, presence: true,
                        content_type: { content_type: /\Aimage\/.*\Z/ },
                        size: { in: 0..1.megabytes }

  def name
    "#{first_name} #{last_name}"
  end
end
