class Cat < ActiveRecord::Base

  COLORS = ['Black','Brown','Orange', 'Striped']
  SEXES = ['M','F']
  
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: SEXES }
  validates :birthdate, :color, :name, presence: true

  def age
    (Time.now.year - birthdate.year)
  end

end
