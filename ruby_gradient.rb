# require "awesome_print"

## TO USE:
# 1. Create a new Gradient with the two end colors, and the amount of steps you'd like your gradient to have in between:
#   -- i.e. gradient = Gradient.new("ffffff", "#d80015", 5)
# 2. This will print the gradient to the console, and return a Gradient object. The gradient colors are stored as an array, to access them either type `gradient.output` or run `gradient.generate`
# 3. To increase/decrease the number of steps in your gradient, simply run `.generate(steps)` with the new number of steps you'd like to use. i.e. `more_detailed_gradient = gradient.generate(15)`.


 
class Gradient
  attr_accessor :color1, :color2, :steps, :output, :colors

  def initialize(color1, color2, steps)
    begin 
      sorted_colors = [hex_to_rgb(color1), hex_to_rgb(color2)].sort{|rgb1, rgb2| rgb1.sum <=> rgb2.sum}.reverse # Put the lighter color first.
      @colors = {lower: sorted_colors[0], higher: sorted_colors[1]}
      @steps = steps
      @output = generate
    rescue Exception => e 
      if (color1.length != 6 || color2.length != 6)
        puts "Colors must be 6 characters in length, not including the # character."
        return nil 
      else 
        puts "Error"
        ap e.message 
        ap e.backtrace.first(10)
        return nil 
      end
    end
  end

  def generate(steps = @steps)
    if steps == @steps && @output != nil
      @output
    else
      @output = [@colors[:lower]]
      @steps = steps
      while @output.length < @steps
        output << get_color_at_step(@output.length)
      end
      output.map!{|c| rgb_to_hex(c)}
    end
    puts "Colors: "
    @output.each_with_index {|c, i|
      puts "  #{(i + 1)}: #{c}"
    }
    @output
  end


  def hex_to_rgb(str)
    str = str[1..-1] if str[0] == "#"
    if str.length != 6
      puts "Hex must be 6 characters in length"
      nil
    else
      rgb = str.scan(/.{2}/).map{|x| x.hex}
    end
  end


  def rgb_to_hex(arr)
    "##{arr.map{|x| rgb_val_to_hex(x)}.join("")}"
  end


  def rgb_val_to_hex(val)
    hex = val.to_s(16)
    hex = hex.length == 1 ? "0#{hex}" : hex
  end


  def hex_to_rgb(str)
    str = str[1..-1] if str[0] == "#"
    if str.length != 6
      puts "Hex must be 6 characters in length"
      nil
    else
      rgb = str.scan(/.{2}/).map{|x| x.hex}
    end
  end

  def get_color_at_step(lower_rgb, upper_rgb, step, steps)
    per = (step.to_f / steps.to_f)
    new_rgb = lower_rgb.map.with_index {|x, i|
      diff = upper_rgb[i] - x 
      (diff * per + x).to_i 
    }
  end

  def get_color_at_step(step)
    steps = @steps - 1 # Account for difference between array index and length of loop
    per = (step.to_f / steps.to_f)
    new_rgb = @colors[:lower].map.with_index {|x, i|
      diff = (@colors[:higher][i] - x) 
      (diff * per + x).to_i
    }
  end

end

