class Stage
  attr_reader :name, :id

  @@stages = {}
  @@total_rows = 0
  #create
  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  # clear
  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  #read
  def self.all
    @@stages.values()
  end

  def save
    @@stages[self.id] = Stage.new(self.name, self.id)
  end

  #update
  def update(name)
    @name = name
  end

  #delete
  def delete()
    @@stages.delete(self.id)
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def self.find(id)
    @@stages[id]
  end
  def artists
    Artist.find_by_stage(self.id)
  end
end

