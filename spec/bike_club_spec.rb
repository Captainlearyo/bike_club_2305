require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe Biker do

  describe "BikeClub" do
    it "exists" do
      bikeclub = BikeClub.new("hells angels")
      expect(bikeclub).to be_a  BikeClub
    end

    it "BikeClub has name" do
      bikeclub = BikeClub.new("hells angels")
      expect(bikeclub.name).to eq ("hells angels")

    end

    it "BikeClub has name" do
      bikeclub = BikeClub.new("hells angels")
      biker = Biker.new("Kenny", 30)
      expect(bikeclub.bikers_list).to eq ([])
      bikeclub.add_biker(biker)
      #expect(bikeclub.bikers_list).to eq ([])
    end

    it "most_rides" do
      bikeclub = BikeClub.new("hells angels")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      

      expect(biker.rides).to eq({})

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

        biker.log_ride(ride1, 92.5)
        biker.log_ride(ride1, 91.1)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)
      
      expect(bikeclub.bikers_list).to eq ([])
      bikeclub.add_biker(biker)
      bikeclub.add_biker(biker2)
      expect(bikeclub.most_rides).to eq ("Kenny")

    end

    it "best_time" do
      bikeclub = BikeClub.new("hells angels")
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 15)
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      

      expect(biker.rides).to eq({})

      biker.learn_terrain!(:gravel)
      biker.learn_terrain!(:hills)

        biker.log_ride(ride1, 92.5)
        biker.log_ride(ride1, 91.1)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)
      
      expect(bikeclub.bikers_list).to eq ([])
      bikeclub.add_biker(biker)
      bikeclub.add_biker(biker2)
      expect(bikeclub.best_time ).to eq ("Kenny")

    end

   
  end
end

