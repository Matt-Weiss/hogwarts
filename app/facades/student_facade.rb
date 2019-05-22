class StudentFacade

  def initialize(house)
    @house = house
  end

  def count_students
    students.count
  end

  def students
    service.students
  end

  private

  def service
    @_service ||= HogwartsService.new(@house)
  end

end
