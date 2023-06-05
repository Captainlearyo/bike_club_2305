require './lib/ride'
require './lib/biker'

RSpec.describe Biker do

  describe "Biker" do
    it "exists" do
      biker = Biker.new("Kenny", 30)
      expect(biker).to be_a  Biker
    end

    describe "Biker" do
      before(:each) do
        @biker = Biker.new("Kenny", 30)
        @biker2 = Biker.new("Athena", 15)
        @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
        @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
      end

      it "Biker returns crrectly" do
       expect(@biker.name).to eq("Kenny")
       expect(@biker.max_distance).to eq(30)
      end

      it "Biker learn_terrain!" do
        expect(@biker.acceptable_terrain).to eq([])
        @biker.learn_terrain!(:gravel)
        @biker.learn_terrain!(:hills)
        expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
       end

       it "can add rides" do
        @biker.log_ride(@ride1, 92.5)
        @biker.log_ride(@ride1, 91.1)
        @biker.log_ride(@ride2, 60.9)
        @biker.log_ride(@ride2, 61.6)
        #expect(@biker.rides).to eq(1)

        expect(@biker.personal_record(@ride1)).to eq(91.1)
        expect(@biker.personal_record(@ride2)).to eq(60.9)
       end

       it "biker 2" do
        @biker2.log_ride(@ride1, 97.0)
        @biker2.log_ride(@ride1, 97.0)
        expect(@biker2.rides).to eq ({})

       end

    end
   
  end
end
