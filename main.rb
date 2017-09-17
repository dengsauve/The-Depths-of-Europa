# by dennis sauve (c) 2017

# Splash should probably go here

# load chapter 1, scene 1

# Extend the Array class for readability in describing scenes
class Array

  def describe
    return self[1]
  end

  def right
    return self[2]
  end

  def forward
    return self[3]
  end

  def left
    return self[4]
  end

  def back
    return self[5]
  end

  def up
    return self[6]
  end

  def down
    return self[7]
  end

end

def load_scene(chapter, scene)
  environment = []
  environment = File.open("chapters/chapter-#{chapter}/scenes/scene-#{scene}.txt").readlines()
  return environment
end

def main()
  scene = load_scene('one', 'one')
  puts scene.describe
  while true
    input = gets.chomp()
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
      else
        puts 'wtf?'
    end
  end
end


main()
