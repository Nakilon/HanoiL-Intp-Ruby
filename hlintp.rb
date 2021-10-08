#!/usr/bin/ruby
# Hopefully an interpreter for Hanoi Love.
# Usage: hlintp.rb file.hl
# This is a work in progress. Be prepared. I'm not.

# Record when this starts, for specs after run
msec = Time.now.to_f * 1000;

code = ARGF.read
le = code.length # input length
cl = 0 # cleaned length
cp = -1 # code pointer
ccp = 0 # code pointer for cleaned code

# Hanoi Love commands are as follows: . ' , ; ` "  : !
commands = [".", "'", ",", ";", "`", "\"", ":", "!"]

# Cleaned code will end up here.
cleaned = []

until (cp+=1) == le
  commands.include?(code[cp]) && (cleaned.push code[cp]) && ccp += 1
end
# Restore defaults
cp = -1
# Make cl exist now
cl = cleaned.length

# HL specific stuff
rg = 0 # value in register (0-255)
st = [sa, sb, sc, sd] # current stack (for A-D)
sa = []
sb = []
sc = []
sd = []

# Interpreting!
until (cp+=1) == cl
  case cleaned[cp]
    when ?.  then st = (st + 1) % 4
    when ?'  then # print "\'"
    when ?,  then # print ","
    when ?;  then # print ";"
    when ?`  then # print "`"
    when ?"  then # print "\""
    when ?:  then # print ":"
    when ?!  then # print "!"
  end
end

# Benchmarking
runtime = Time.now.to_f * 1000 - msec
 
puts ""
puts ""
puts "Your program took #{runtime} msecs."