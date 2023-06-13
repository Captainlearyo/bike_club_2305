class BikeClub
 attr_reader :name, :bikers_list
 #attr__accessor :
    def initialize(name)
        @name = name
        @bikers_list = []
    end  

    def add_biker(biker)
        @bikers_list << biker
    end

    def most_rides
        most = 0
        rider = nil
        @bikers_list.each do  |i| 
            if i.rides.count > most
                most = i.rides.count
                rider = i.name
            end
        end
        rider
    end

    def best_time(ride)
        time = 1/0
        rider = nil
        @bikers_list.each do  |i| 
            if i.rides.min < time 
                time  = i.rides.min
                rider = i.name
            end
        end
        rider
    end


end