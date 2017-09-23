# will allow testing of specific scenes in module Chapter_One

require_relative('lib/chapter_one')
require_relative('utils')

while true
  chapter_one = {}
  puts "Chapter One \n\n"
  Chapter_One.methods(false).each_with_index do |method, index|
    chapter_one[index + 1] = method.to_s
    puts (index + 1).to_s + ' ' + method.to_s
  end

  print "\nPlease enter the name of the scene to run: "
  user_index = gets.chomp().to_i

  if Chapter_One.respond_to?(chapter_one[user_index])
    Chapter_One.send(chapter_one[user_index])
    break
  else
    puts "That is not a valid scene\n"
  end
end