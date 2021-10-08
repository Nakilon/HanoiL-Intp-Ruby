#!/usr/bin/ruby
# Hopefully an interpreter for Hanoi Love.
# Usage: hlintp.rb file.hl
# This is a work in progress. Be prepared. I'm not.

module HanoiLove
  # ResultStruct = Struct.new :stdout, :stack, :exitcode
  def self.run code, stdout = StringIO.new, stdin = STDIN

# # Record when this starts, for specs after run
# msec = Time.now.to_f * 1000;

cp = -1 # code pointer

code.delete "^.',;`:!\""  # Hanoi Love commands are as follows: . ' , ; ` "  : !

# Make cl exist now
cl = code.length # cleaned code length

# HL specific stuff
rg = 0 # value in register (0-255)
sa, sb, sc, sd = [], [], []. []
st = [sa, sb, sc, sd] # current stack (for A-D)

# Interpreting!
until cl == cp += 1
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

  end
end

# puts ""
# puts ""
# puts "Your program took #{runtime} msecs."
