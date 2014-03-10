require 'pry'
class GameOfLife

  attr_reader :cells

  def initialize(options={})
    rows = options[:rows] || 3
    cols = options[:columns] || 3
    generate(rows, cols)
  end

  def board
    cells.collect {|row| row.join(' ')}.join("\n")
  end

  def make_live(options={})
    raise_if_invalid(options)
    row = options[:row]
    column = options[:column]
    cells[row][column] = 'X'
  end

  def make_dead(options={})
    raise_if_invalid(options)
    row = options[:row]
    column = options[:column]
    cells[row][column] = 'O'
  end

  #def run
  #  system 'clear' or system 'cls'
  #  5.times do
  #    puts board
  #    sleep 1
  #    system 'clear' or system 'cls'
  #  end
  #end

  private

  def generate(rows, cols)
    @cells = Array.new(rows) {Array.new(cols)}
    cells.each_with_index do |row, i|
      row.each_index do |j|
        cells[i][j] = "O"
      end
    end
  end

  def raise_if_invalid(options)
    if illegal_row(options[:row]) || illegal_column(options[:column])
      raise ArgumentError, "That cell does not exist"
    end
  end

  def illegal_row(row)
    row > cells.length
  end

  def illegal_column(column)
    column > cells.first.length
  end

end
