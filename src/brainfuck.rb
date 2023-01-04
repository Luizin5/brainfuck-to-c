require_relative "c_equivalent"

class BF
  include C

  def initialize code
    p code
    @c_eq = C_equivalent.new
    @c_writer = Writer.new
    start_reading code.split("")
  end

  def start_reading code

    code.each do |c|
      case c
      when "+"
        @c_writer.append_to_code(@c_eq.op_plus)
      when "-"
        @c_writer.append_to_code(@c_eq.op_minus)
      when "."
        @c_writer.append_to_code(@c_eq.op_dot)
      when ","
        @c_writer.append_to_code(@c_eq.op_comma)
      when ">"
        @c_writer.append_to_code(@c_eq.op_right)
      when "<"
        @c_writer.append_to_code(@c_eq.op_left)
      when "["
        @c_writer.append_to_code(@c_eq.op_obracket)
      when "]"
        @c_writer.append_to_code(@c_eq.op_cbracket)
      end
      @c_writer.write
    end

  end
end


