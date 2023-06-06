class Biker
 attr_reader :name, :max_distance, :acceptable_terrain, :rides
 #attr__accessor :
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
      if @acceptable_terrain.include?(ride.terrain)
        if rides.include?(ride)
         rides[ride] << distance
        else
        rides[ride] = [distance]
        end
      else
        return `#{@name} doesn't know this terrain yet`
      end
   end

    def personal_record(ride)
      rides[ride].min()
    end
end