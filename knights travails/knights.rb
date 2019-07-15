require_relative "00_tree_node.rb"
attr_reader :position

class KnightPathFinder
  def initialize(position)
    @position = position
    # @root_node = PolyTreeNode.new(position)
    @considered_positions = [position]
  end

  def self.valid_moves(position) 
    # check all 8 positions possible, filter out positions that are out of bounds
    # [0][0] [0][0] [0][0] [0][0] [0][0] [7][7] 
    result = []
    move = [[2,1], [1,2], [-1,2], [-1,-2], [1,-2], [-2,1], [-2,-1], [2,-1]] 
    move.each do |mv|
      x = mv[0] + position[0]
      y = mv[1] + position[1]
      valid_nums = (0..7).to_a

      if valid_nums.include?(x) && valid_nums.include?(y)
        result << [x,y]
      end
    end

    result
  end

  def new_move_positions(position) # this should call ::valid_moves method 
                                  #but filter out considered_positions.
    # call valid moves 
    # filter out if inside considered positions array
    # return new_moves array
    

    possible_moves = KnightPathFinder.valid_moves(position)
    possible_moves.select { |move| !@considered_positions.include?(move) }


  end


  def build_move_tree
    @position 
    PolyTreeNode.new(@position)
  end

  
end

test = KnightPathFinder.new([0,0])

p test.new_move_positions([0,0]) # [[2,1],[1,2]]

