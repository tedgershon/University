67-272: University 
===
This project was created as means of giving students an opportunity to practice course concepts with some in-class learning exercises. There is no pretense that this is a production-ready system or that it has 100 percent test coverage -- these are for learning purposes.  

Some items and helper files have been added in advance to speed up time in-class to complete these exercises.  For example, Prof. H's `minitest_extensions` module is present and included in `test/test_helper.rb` by default.  Another example is that `validates_timeliness` gem is installed and the initializer for that gem has also been run for you.  Note that time zone in `config/application.rb` was defaulted to Eastern (Pgh) time; feel free to change this as appropriate.

You may work and talk with others in class for help completing this exercise.


Instructions for Part 1
---
Having cloned this repo to your laptop (recommended) or gotten the zip file from GitHub, we need to set up the project as follows:

1. Install gems with `bundle install`
2. Create the database with `rails db:migrate`
3. Open up `app/models/department.rb` and review the code
4. Open up `app/models/faculty.rb` and review the code comments given
5. Open up `test/models/faculty_test.rb` and complete the tests so the methods commented on will be covered properly and completely
	- to speed things up, we have provided a context for both departments and faculties for you.
	- before testing, load the testing data into a clean copy of your dev database with the command `rails db:contexts`. (_Note that this is not built into Rails; it was written for you and also exists in your project starter code._) Once that's done and the contexts build without error, re-open rails console and run `Department.all` and `Faculty.all` and see that the testing context data is loaded in the dev environment.

6. Run the tests and see that tests for department passes while tests for faculty fail.
7. Complete the code in `app/models/faculty.rb` so that the tests pass with 100% test coverage
8. What would `Faculty.alphabetical.active.first.department` return in rails console?  Go to rails console and verify that you are correct (or if not, figure out why you were wrong)

Qapla'

Prof. H & Prof. Shihong
