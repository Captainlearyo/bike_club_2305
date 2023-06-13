class Biker
attr_reader :name, :max_distance, :acceptable_terrain, :rides

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end  

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end
    
  def log_ride(ride, distance)
     @acceptable_terrain.include?(ride.terrain)

    
    if !@acceptable_terrain.include?(ride.terrain)
      @name + " " + "doesnt know this terrain yet"
    elsif @max_distance < ride.total_distance 
        @name + " " + "can't bike this distance"
    else 
      if @rides.include?(ride)
        @rides[ride] << distance
      else 
       @rides[ride] = [distance]
      end
      @name + " " + "knows this terrain and can bike this distance"
    end
  end

    def personal_record(ride)
      if rides[ride]
      rides[ride].min
      else
        false
      end
    end
  end