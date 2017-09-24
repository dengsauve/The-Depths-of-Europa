# by dennis sauve (c) 2017

require_relative 'utils'
require_relative 'lib/chapter_one'


if __FILE__ == $0
  puts splash
  puts 'press enter to start'
  gets

  # load chapter 1, scene 1
  Chapter_One.chapter_one_scene_one

  # load chapter 2, scene 1

  # etc. etc. etc.

end