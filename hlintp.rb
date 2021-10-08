#!/usr/bin/ruby
# Hopefully an interpreter for Hanoi Love.
# Usage: hlintp.rb file.hl
# This is a work in progress. Be prepared. I'm not.

Encoding::default_internal = Encoding::default_external = "ASCII-8BIT"

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
    sa, sb, sc, sd = [], [], [], []
    ss = [sa, sb, sc, sd] # current stack (for A-D)
    st = 0

    iomode = false

    # Interpreting!
    until cl == cp += 1
      case code[cp]
        when ?. then st = (st + 1) % 4
        when ?' then iomode ? stdout.print(rg.chr) : ss[st].push(rg)                  # TODO stack D
        when ?, then rg = (iomode ? stdin.getbyte : ss[st].pop || (st == 0 ? 1 : 0))  # TODO stack D
        when ?; then # print ";"
        when ?` then # print "`"
        when ?" then iomode ^= true
        when ?: then # print ":"
        when ?! then # print "!"
      end
    end

    # # Benchmarking
    # runtime = Time.now.to_f * 1000 - msec

    stdout

  end
end

# puts ""
# puts ""
# puts "Your program took #{runtime} msecs."
