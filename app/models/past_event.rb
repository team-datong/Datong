require 'date'

class PastEvent < ActiveRecord::Base
  # should add some validations for existance of date, time, should also have helpers that will allow us to
  validates_presence_of :title, :description, :date_and_time
  # extract and format date and time.

end
