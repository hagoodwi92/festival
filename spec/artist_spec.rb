require 'rspec'
require 'artist'

describe '#Artist' do

  before(:each) do
    Artist.clear()
    Stage.clear()
    @stage = Stage.new("Who?", nil)
    @stage.save()
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another stage") do
      artist = Artist.new("The Beatles", @stage.id , nil)
      artist2 = Artist.new("The Beatles", @stage.id , nil)
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do
    it("returns a list of all artists") do
      artist = Artist.new("The Beatles", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Grateful Dead", @stage.id, nil)
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end
  describe('#save') do
    it("saves an album") do
      artist = Artist.new("Who?", @stage.id, nil) # nil added as second argument
      artist.save()
      artist2 = Artist.new("Which?", @stage.id, nil) # nil added as second argument
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end
  describe('.clear') do
    it("clears all stages") do
      artist = Artist.new("Who?", @stage.id , nil)
      artist.save()
      artist2 = Artist.new("Which", @stage.id , nil)
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end
  describe('#delete') do
    it("deletes an stage by id") do
      artist = Artist.new("Who?", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Which?", @stage.id, nil)
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new("The Beatles" ,@stage.id, nil)
      artist.save()
      artist.update("Radiohead", @stage.id)
      expect(artist.name).to(eq("Radiohead"))
    end
  end
  describe('.find_by_stage') do
    it("finds artist for an stage") do
      stage2 = Stage.new("Which?", nil)
      stage2.save()
      artist = Artist.new("Radiohead", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("California", stage2.id , nil)
      artist2.save()
      expect(Artist.find_by_stage(stage2.id)).to(eq([artist2]))
    end
  end
  describe('#stage') do
    it("finds the stage a artist belongs to") do
      artist = Artist.new("The Beatles", @stage.id, nil)
      artist.save()
      expect(artist.stage()).to(eq(@stage))
    end
  end
end
