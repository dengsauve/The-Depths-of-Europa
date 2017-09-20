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

  while true

  end
end


def main()
  puts splash
  puts 'press enter to start'
  gets.chomp()

  # load chapter 1, scene 1
  chapter_one_scene_one
end


main()
