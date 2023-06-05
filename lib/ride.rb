class Ride
 attr_reader :name, :distance, :loop, :terrain, :total_distance
 #attr__accessor :
    def initialize(obj)
      @name = obj[:name]
      @distance = obj[:distance]
      @loop = obj[:loop]
      @terrain = obj[:terrain]
      @total_distance = loop? ? @distance : 2 * @distance
       


    end  

    def loop?
      return loop
    end

end