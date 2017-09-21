# by dennis sauve (c) 2017

require_relative 'utils'
require_relative 'lib/chapter_one'


def load_scene(chapter, scene)
  return File.open("chapters/chapter-#{chapter}/scenes/scene-#{scene}.txt").readlines()
end


def main
  puts splash
  puts 'press enter to start'
  gets.chomp()

  # load chapter 1, scene 1
  chapter_one_scene_one
end


main
