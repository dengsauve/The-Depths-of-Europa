# Chapter One Module
# So far this is the story line in the shuttle.
# I imagine Chapter Two starting out on the surface of Europa.


module Chapter_One
  @eaten = false
  @swoll = false
  @belted_in = true

  def self.chapter_one_scene_one
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
              puts  "Command not understood.\n\n"
            end
        end
      end
    end
    chapter_one_scene_two
  end


  def self.chapter_one_scene_two
    scene = load_scene('one', 'two')
    puts scene.describe

    while true
      r_value, input = basic_input(scene)
      puts
      puts r_value unless r_value == -1
      if r_value == -1
        if command_match(input, %w(undo remove the belt belts))
          puts 'You remove the belts strapping you in. You are now free to leave the cabin.'
          @belted_in = false
        elsif command_match(input, %w(leave the cabin go to general recreation center gen rec))
          if @belted_in
            puts '', 'You must undo your belt before you can move around.'
          else
            puts '', 'You leave the cabin and arrive in the general quarters.'
            break
          end
        else
          puts '', 'Command not understood'
        end
      end
    end

    chapter_one_scene_three
  end


  def self.chapter_one_scene_three
    scene = load_scene('one', 'three')
    puts scene.describe

    while true
      r_value, input = basic_input(scene)
      puts
      puts r_value unless r_value == -1
      if r_value == -1
        if command_match(input, %w(eat make food))
          puts '', "You go to the kitchen and make yourself some food. Standard space rations. Delicious.\n" unless @eaten
          puts '', "You've had your allotted food for the day. Besides, it's really not that good.\n" if @eaten
          @eaten = true
        elsif command_match(input, %w(look at inspect gear))
          puts '', 'Space suits, sampling equipment, some basic weapons are secured in this corner.'
        elsif command_match(input, %w(pick up equip take weapon gun taser tazer energy sword))
          puts '', "You really don't know how to use that."
        elsif command_match(input, %w(use workout equipment area))
          puts '', 'You train for thirty minutes, a good cardiovascular workout.' unless @swoll
          puts '', "You've worked out enough already you stud." if @swoll
          @swoll = true
        elsif command_match(input, %w(go to enter command cabin))
          chapter_one_scene_two
        elsif command_match(input, %w(go to enter stasis room))
          break
        else
          puts '', 'Command not understood'
        end
      end
    end

    chapter_one_scene_four
  end

  def self.chapter_one_scene_four
    scene = load_scene('one', 'four')
    puts scene.describe

    while true
      r_value, input = basic_input(scene)
      puts
      puts r_value unless r_value == -1
      if r_value == -1
        if command_match(input, %w(talk with to natasha))
          puts "You ready for the long nap? Next thing you know we'll be waking up in orbit around Europa",''
        elsif command_match(input, %w(get in enter lay on stasis bed))
          puts "You get into your stasis bed along with everyone. Julian gives the final order to engage the stasis field to the computer, and you slowly drift off to sleep."
        else
          puts 'Command not understood', ''
        end
      end
    end
  end
end