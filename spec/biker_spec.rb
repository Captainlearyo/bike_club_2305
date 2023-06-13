require './lib/ride'
require './lib/biker'

RSpec.describe Biker do

  describe "Biker" do
    it "exists" do
      biker = Biker.new("Kenny", 30)
      expect(biker).to be_a  Biker
    end

    describe "Biker" do
     
        biker = Biker.new("Kenny", 30)
        biker2 = Biker.new("Athena", 15)
        ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      

      it "Biker returns crrectly" do
       expect(biker.name).to eq("Kenny")
       expect(biker.max_distance).to eq(30)
      end

      it "learn_terrain! " do
        expect(biker.name).to eq("Kenny")
        expect(biker.acceptable_terrain).to eq([])
        biker.learn_terrain!(:gravel)
        expect(biker.acceptable_terrain).to eq([:gravel])
        biker.learn_terrain!(:hills)
        expect(biker.acceptable_terrain).to eq([:gravel, :hills])
       end

       it "log_ride" do
        expect(biker.rides).to eq({})
        biker.log_ride(ride1, 92.5)
        biker.log_ride(ride1, 91.1)
        biker.log_ride(ride2, 60.9)
        biker.log_ride(ride2, 61.6)

        #expect(biker.rides).to eq({})
       end

       it "personal_record" do
        expect(biker.personal_record(ride1)).to eq(91.1)
        expect(biker.personal_record(ride2)).to eq(60.9)
       end

       it "personal_record" do
        expect(biker2.rides).to eq({})
        expect(biker2.log_ride(ride1, 97.0)).to eq("Athena doesnt know this terrain yet")
        expect(biker2.log_ride(ride2, 67.0)).to eq("Athena doesnt know this terrain yet")

        biker2.learn_terrain!(:gravel)
        biker2.learn_terrain!(:hills)

        expect(biker2.log_ride(ride1, 95.0)).to eq("Athena can't bike this distance")
        expect(biker2.log_ride(ride2, 65.0)).to eq("Athena knows this terrain and can bike this distance")
        expect(biker2.personal_record(ride2)).to eq(65.0)
        expect(biker2.personal_record(ride1)).to be false
     
       end



       
    end
   
  end
end
