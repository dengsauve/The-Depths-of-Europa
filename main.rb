# by dennis sauve (c) 2017

require_relative 'utils'


def load_scene(chapter, scene)
  return File.open("chapters/chapter-#{chapter}/scenes/scene-#{scene}.txt").readlines()
end


def chapter_one_scene_one
  scene = load_scene('one', 'one')
  puts scene.describe

  while true
    r_value, input = basic_input(scene)
    puts
    puts r_value unless r_value == -1
    if r_value == -1
      case input
        when 'talk to natasha', 'talk natasha'
          "Natasha says: 'It looks like mission control is finally ready for the launch. Better answer that radio.'"
        else
          if (input.split - %w(answer turn on activate radio)).empty?
            puts "Mission Control: 'We show all systems clear. You can press the launch button at any time. God Speed!'"

          elsif (input.split - %w(press activate launch button)).empty?
            puts "With a deafening roar, you're thrust back into your seat as the primary booster flares to life.
  You feel like the pressure can't get any greater, but as the shuttle begins to ascend, you find out you were wrong.
  Training didn't prepare you for this experience, and you black out...\n\n"
            #load next scene
            break

          else
            puts '', 'Command not understood.'
          end
      end
    end
  end
  chapter_one_scene_two
end


def chapter_one_scene_two
  scene = load_scene('one', 'two')
  puts scene.describe
  belted_in = true

  while true
    r_value, input = basic_input(scene)
    puts
    puts r_value unless r_value == -1
    if r_value == -1
      if command_match(input, %w(undo remove the belt belts))
        puts 'You remove the belts strapping you in. You are now free to leave the cabin.'
        belted_in = false
      elsif command_match(input, %w(leave the cabin))
        if belted_in
          puts '', 'You must undo your belt before you can move around.'
        else
          puts '', 'You leave the cabin and arrive in the general quarters.'
          # transition to chapter one scene three
          break
        end
      else
        puts '', 'Command not understood'
      end
    end
  end

  #chapter_one_scene_three
end


def chapter_one_scene_three
  scene = load_scene('one', 'three')
  puts scene.describe

  # input handling loop
  
end


def main
  puts splash
  puts 'press enter to start'
  gets.chomp()

  # load chapter 1, scene 1
  chapter_one_scene_one
end


main
