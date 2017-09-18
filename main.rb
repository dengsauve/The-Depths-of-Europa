# by dennis sauve (c) 2017

# load chapter 1, scene 1

# Extend the Array class for readability in describing scenes

require_relative 'utils'

class Array

  def describe
    return self[1] + "\n"
  end

  def right
    return self[2] + "\n"
  end

  def forward
    return self[3] + "\n"
  end

  def left
    return self[4] + "\n"
  end

  def back
    return self[5] + "\n"
  end

  def up
    return self[6] + "\n"
  end

  def down
    return self[7] + "\n"
  end

end

def load_scene(chapter, scene)
  environment = []
  environment = File.open("chapters/chapter-#{chapter}/scenes/scene-#{scene}.txt").readlines()
  return environment
end

def main()
  # Splash should probably go here
  puts splash
  puts 'press enter to start'
  gets.chomp()

  scene = load_scene('one', 'one')
  puts scene.describe
  while true
    input = gets.chomp()
    puts
    case input
      when 'right', 'look right'
        puts scene.right
      when 'forward', 'look forward'
        puts scene.forward
      when 'left', 'look left'
        puts scene.left
      when 'back', 'backward', 'look back', 'look backward'
        puts scene.back
      when 'up', 'look up'
        puts scene.up
      when 'down', 'look down'
        puts scene.down
      when 'help'
        puts help
      else
        puts "Command not understood \n\n"
    end
  end
end


main()
