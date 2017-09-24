# by dennis sauve (c) 2017

# Extend the Array class for readability in describing scenes
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
    return self[7] + "\n\n"
  end

end


def splash
  return '''
  ________            ____             __  __                  ____   ______
 /_  __/ /_  ___     / __ \___  ____  / /_/ /_  _____   ____  / __/  / ____/_  ___________  ____  ____ _
  / / / __ \/ _ \   / / / / _ \/ __ \/ __/ __ \/ ___/  / __ \/ /_   / __/ / / / / ___/ __ \/ __ \/ __ `/
 / / / / / /  __/  / /_/ /  __/ /_/ / /_/ / / (__  )  / /_/ / __/  / /___/ /_/ / /  / /_/ / /_/ / /_/ /
/_/ /_/ /_/\___/  /_____/\___/ .___/\__/_/ /_/____/   \____/_/    /_____/\__,_/_/   \____/ .___/\__,_/
                            /_/                                                         /_/
by Dennis Sauve


'''
end


# Opens text file based on chapter and scene, reads and returns array of file lines
def load_scene(chapter, scene)
  return File.open("chapters/chapter-#{chapter}/scenes/scene-#{scene}.txt").readlines()
end

# Extended list of commands to be fleshed out as the game progresses
def help
  return '''Commands:
- look [ left | right | forward | back | up | down ]

'''
end


def basic_input(scene)
  input = gets.chomp().rstrip.downcase
  case input
    when ''
      return "Type help for a list of commands\n\n"
    when 'right', 'look right'
      return scene.right
    when 'forward', 'look forward'
      return scene.forward
    when 'left', 'look left'
      return scene.left
    when 'back', 'backward', 'look back', 'look backward'
      return scene.back
    when 'up', 'look up'
      return scene.up
    when 'down', 'look down'
      return scene.down
    when 'look around'
      return scene.describe
    when 'look'
      return "Look where?\n\n"
    when 'talk', 'talk to'
      return "Talk to whom?\n\n"
    when 'speak', 'speak to'
      return "Speak to whom?\n\n"
    when 'attack'
      return "Attack what?\n\n"
    when 'help'
      return help
    when 'exit', 'quit'
      exit
    else
      if input.strip() == ''
        return "Type help for a list of commands\n\n"
      else
        return -1, input
      end
  end
end

def command_match(input, command)
  return (input.split - command).empty?
end