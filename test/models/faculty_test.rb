require "test_helper"

class FacultyTest < ActiveSupport::TestCase
  # Matchers
  should have_many(:assignments)
  should have_many(:courses).through(:assignments)
  should belong_to(:department)
  ### ensure faculty can't be created without necessary attributes:
  # t.string :first_name
  # t.string :last_name
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  ### Faculty.rank = `Assistant Professor`, `Associate Professor`, or `Professor`
  # t.string :rank
  # copilot wrote the line below
  should validate_inclusion_of(:rank).in_array(["Assistant Professor", "Associate Professor", "Professor"])
  # t.boolean :active


  # Context
  context "Given context" do
    setup do 
      # build the testing context here...
      create_departments
      create_faculties
    end

    # with that testing context, write your tests...
    should "test first_name validation" do
      faculty = Faculty.new(last_name: "Kim", rank: "Assistant Professor", department: @cs)
      assert_not faculty.valid?, "Faculty should be invalid without a first name"
      assert_includes faculty.errors[:first_name], "can't be blank"
    end

    should "test last_name validation" do
      faculty = Faculty.new(first_name: "Jisoo", rank: "Associate Professor", department: @cs)
      assert_not faculty.valid?, "Faculty should be invalid without a last name"
      assert_includes faculty.errors[:last_name], "can't be blank"
    end

    should "only allow valid faculty ranks" do
      valid_ranks = ["Assistant Professor", "Associate Professor", "Professor"]
      valid_ranks.each do |rank|
        faculty = Faculty.new(first_name: "John", last_name: "Doe", rank: rank, department: @cs)
        assert faculty.valid?, "Faculty with rank #{rank} should be valid"
      end
    end

      # teardown do
      #   destroy_departments
      #   destroy_faculties
      # end
  end
end
