require 'pry'

width = 170

str = ' ' * width

chars = []

# 20.times do
#   hexes = "0123456789ABCDEF".split('')
#   char = [("0" + (0..2).map { hexes.sample }.join).hex].pack("U")
#   chars << char
# end

chars = chars + (' ' * 1000 + '-' * 10 + '|' * 10 + '/' * 10 + '\\' * 10).split('') +
        "458kgfjerotiu34lkjsdf09324<>!@$%^%^&*()1234566788103938485757:{}|][;".split('')

(0..100000).each do |n|
  osc = 1 # 6 + 5 * Math.sin( 2*Math::PI * (n/10) )
  osc2 = 1 # 6 + 5 * Math.cos( 2*Math::PI * (n/10) )

  str = (0..width-1).inject('') do |memo, n| 
    if str[n] == '.'
      if rand(3 * osc) != 0
        memo + str[n]
      else
        memo + ' '
      end
    elsif str[n] == ' '
      memo + chars.sample
    else
      if rand(3 * osc2) != 0
        memo + str[n]
      else
        memo + '.'
      end
    end
  end

  print str + "\n"
  sleep(0.05)
end