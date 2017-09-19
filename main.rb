# by dennis sauve (c) 2017

require_relative 'utils'


def load_scene(chapter, scene)
  environment = []
  environment = File.open("chapters/chapter-#{chapter}/scenes/scene-#{scene}.txt").readlines()
  return environment
end

def main()
  puts splash
  puts 'press enter to start'
  gets.chomp()

  # load chapter 1, scene 1
  scene = load_scene('one', 'one')
  puts scene.describe
  while true
    input = gets.chomp().downcase
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
      when 'look'
        puts "Look where?\n\n"
      when 'help'
        puts help
      else
        contains = false
        (8..scene.length).each do |num|
          input.split().each do |command|
            scene[num].split().include?(command) ? contains = true : contains = false
          end
          if contains
            puts scene[num + 1], ''
            break
          end
        end
        puts "Command not understood \n\n" unless contains
    end
  end
end


main()
