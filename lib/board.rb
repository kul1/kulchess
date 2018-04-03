Dir[File.dirname(__FILE__) + '/pieces/*.rb'].each { |file| require file }

# Stores piece objects on a grid and renders board
class Board
  attr_accessor :grid, :turn, :move_success

  def initialize
    @turn = :white
    @grid = Array.new(8) { Array.new(8, '   ') }
    @dead_pieces = []
  end

  def render

    puts %q{
------------------------------   
|   a  b  c  d  e  f  g  h   |}
    
    7.downto(0) do |i|
        print "|#{i+1} "
        
      grid[i].each_with_index do |cell, cell_idx|

        if i.even? && cell_idx.even?
          print colorize(cell, "30;42")
        elsif i.odd? && cell_idx.odd?
          print colorize(cell, "30;42")
        else
          print colorize(cell, "30;47")
        end
        
      end
      
      puts " #{i+1}|"
    end
    
    puts %q{|   a  b  c  d  e  f  g  h   |
------------------------------} 
  end



  private
# Detail about colorize from   
# https://stackoverflow.com/questions/1489183/colorized-ruby-output
def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end 

end
