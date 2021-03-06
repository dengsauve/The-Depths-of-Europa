=begin
  The Depth's of Europa, Chapter 1
  by: Dennis Sauve

  Chapter One
  So far this is the story line in the shuttle.
  I imagine Chapter Two starting out on the surface of Europa.
  This chapter covers shuttle launch, going down for the long nap, and waking up to realize the entire crew is dead.
  The chapter will end by crash landing the shuttle on the surface of Europa.
=end


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
        if command_match(input, %w(speak talk to with natasha))
          puts "Natasha: 'It looks like mission control is finally ready for the launch. Better answer that radio.'\n\n"
        elsif command_match(input, %w(answer turn on activate radio))
            puts "Mission Control: 'We show all systems clear. You can press the launch button at any time. God Speed!'\n\n"

        elsif command_match(input, %w(press activate launch button))
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
          puts 'You remove the belts strapping you in. You are now free to leave the cabin.', ''
          @belted_in = false

        elsif command_match(input, %w(leave the cabin go to general recreation center gen rec))
          if @belted_in
            puts 'You must undo your belt before you can move around.', ''
          else
            puts 'You leave the cabin and arrive in the general quarters.', ''
            break
          end

        else
          puts 'Command not understood', ''
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
          puts "You go to the kitchen and make yourself some food. Standard space rations. Delicious.\n\n" unless @eaten
          puts "You've had your allotted food for the day. Besides, it's really not that good.\n\n" if @eaten
          @eaten = true

        elsif command_match(input, %w(look at inspect gear))
          puts 'Space suits, sampling equipment, some basic weapons are secured in this corner.', ''

        elsif command_match(input, %w(pick up equip take weapon gun taser tazer energy sword))
          puts "You really don't know how to use that.\n\n"

        elsif command_match(input, %w(use workout equipment area))
          puts 'You train for thirty minutes, a good cardiovascular workout.', '' unless @swoll
          puts "You've worked out enough already you stud.\n\n" if @swoll
          @swoll = true

        elsif command_match(input, %w(go to enter command cabin))
          chapter_one_scene_two

        elsif command_match(input, %w(go to enter stasis room))
          break

        else
          puts 'Command not understood', ''
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
        if command_match(input, %w(speak talk with to natasha))
          puts "Natasha: 'You ready for the long nap? Next thing you know we'll be waking up in orbit around Europa.'\n\n"

        elsif command_match(input, %w(speak talk with to james))
          puts "James: 'I'm pretty sure this bucket will get us to Europa and back. Sweet dreams laddie.'\n\n"

        elsif command_match(input, %w(speak talk with to julian))
          puts "Julian: 'It's incredible really. This journey will provide us with the first long term effects of the Bio-Stasis machine on humans in space. Nothing like this has ever been attempted. I'm sure it's completely safe though, heh heh.... not to worry.' *Julian looks a little worried*\n\n"

        elsif command_match(input, %w(speak talk with to harry))
          puts "Harry: 'I signed up for this mission to gain extensive experience working with our systems in the field, but that was before I knew we'd be sleeping most of the way here and back. Maybe I'll just dream of operations...'\n\n"

        elsif command_match(input, %w(get in into go to enter lay on stasis bed))
          puts 'You get into your stasis bed along with everyone. Julian gives the final order to engage the stasis field to the computer, and you slowly drift off to sleep.', ''
          break

        else
          puts 'Command not understood', ''
        end
      end
    end

  chapter_one_scene_five
  end


  def chapter_one_scene_five
    @eaten = false
    @swoll = false


  end
end