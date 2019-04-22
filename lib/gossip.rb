
require 'csv'



class Gossip

attr_accessor :author, :content

  def initialize (author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << ["#{@author}", "#{@content}"]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    idx = id.to_i
    puts idx
    all_gossips = Gossip.all
    return all_gossips[idx]
  end

  def self.edit(id,txt_to_edit)
    idx = id.to_i
    all_gossips = Gossip.all
    puts all_gossips[idx].content = txt_to_edit
    CSV.open("./db/gossip.csv", "w") do |csv|
      csv = ""
    end
    all_gossips.each {|x| x.save}
  end


end


