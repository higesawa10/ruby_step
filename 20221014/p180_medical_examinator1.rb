class MedicalExaminator
  def height=(height)
    @height = height
  end

  def height
    @height
  end
end

examinator = MedicalExaminator.new
examinator.height =170
p examinator.height