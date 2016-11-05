
# NOTE: The initialization of the factory takes a relatively long time due to construction
# of the name set for future use.  This is necessary to ensure that robot names are as
# unique as possible while also allowing for their re-use if needed
class RobotFactory

  def initialize
    @names = ('AA000'..'ZZ999').to_a
    @available_names = @names.dup
  end

  def new_robot
    Robot.new(self)
  end

  # If a new available_names array is created and then free_name() is called, there is
  # the potential for duplicate names to exist within available_names and then be
  # assigned to robots.  There are a few potential solutions, but probably the best one
  # is to have longer serial numbers.
  def new_name
    @available_names = @names if @available_names.length == 0
    new_name = @available_names.sample
    @available_names.delete new_name
    return new_name
  end

  def release_name(name)
    @available_names << name
  end

end

class Robot
  attr_reader :name

  @@factory = RobotFactory.new

  def name
    @name = @@factory.new_name unless @name
    @name
  end

  def reset
    @@factory.release_name(@name)
    @name = nil
  end

end

module BookKeeping
  VERSION = 2
end
