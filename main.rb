# by dennis sauve (c) 2017

require_relative 'utils'
require_relative 'lib/chapter_one'


def main
  puts splash
  puts 'press enter to start'
  gets

  # load chapter 1, scene 1
  Chapter_One.chapter_one_scene_one

end


main
