require 'rspec'
require 'stage'

describe '#Stage' do

  before(:each) do
    Stage.clear()
    Artist.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no stages") do
      expect(Stage.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an album") do
      stage = Stage.new("Who?", nil) # nil added as second argument
      stage.save()
      stage2 = Stage.new("Which?", nil) # nil added as second argument
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end

  describe('#==') do
    it("is the same stage if it has the same attributes as another stage") do
      stage = Stage.new("Who?", nil)
      stage2 = Stage.new("Who?", nil)
      expect(stage).to(eq(stage2))
    end
  end

  describe('.clear') do
    it("clears all stages") do
      stage = Stage.new("Who?", nil)
      stage.save()
      stage2 = Stage.new("Which", nil)
      stage2.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end
  end
  describe('#delete') do
    it("deletes an stage by id") do
      stage = Stage.new("Who?", nil)
      stage.save()
      stage2 = Stage.new("Which?", nil)
      stage2.save()
      stage.delete()
      expect(Stage.all).to(eq([stage2]))
    end
  end
  describe('.find') do
    it("finds an stage by id") do
      stage = Stage.new("Who?", nil)
      stage.save()
      stage2 = Stage.new("Which?", nil)
      stage2.save()
      expect(Stage.find(stage.id)).to(eq(stage))
    end
  end
  describe('#update') do
    it("updates an stage by id") do
      stage = Stage.new("Who?" ,nil)
      stage.save()
      stage.update("A Love Supreme")
      expect(stage.name).to(eq("A Love Supreme"))
    end
  end
  describe('#artists') do
    it("returns an stages's artist") do
      stage = Stage.new("Who?", nil)
      stage.save()
      artist = Artist.new("The Beatles", stage.id, nil)
      artist.save()
      artist2 = Artist.new("Radiohead", stage.id, nil)
      artist2.save()
      expect(stage.artists).to(eq([artist, artist2]))
    end
  end
end