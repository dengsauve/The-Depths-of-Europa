# by dennis sauve (c) 2017

# Splash should probably go here

# load chapter 1, scene 1

def load_scene(chapter, scene)
  environment = []
  environment = File.open("chapters/chapter-#{chapter}/scenes/scene-#{scene}.txt").readlines()
  return environment
end

puts load_scene('one', 'one')