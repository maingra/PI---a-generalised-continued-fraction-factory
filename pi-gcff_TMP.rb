#                                    -------   EXPERIMENTAL    -------
# Author:                                mark.ingram@computer.org
# license:                                     Ruby license
# This is a crude Template metaprogramming file written in ruby
# As such it produces output ruby code for running
# the method piPart returns code for the calculation of PI to any desired level of accuracy
#                it is highly recommended that you start with low numbers like piPart(1,2)
# the calculaton is partitioned in to blocks of 1000 sub calculations
# the intention of these blocks it to test M500's parallel famework QZ, intention sub calculations to be run in parallel

def piPart(rstart,itter)
tmp1 = []
  header = "require 'm500';"
  header += "z5 = Time::now;\n"
  header += "p \" PI\";\n"
  header += "class Kettenbruch;\n"
  header += " def Kettenbruch::allseitigfactory(a,y=true);\n"
  header += "    p \"raise error\" unless a.kind_of?(Array);\n"
  header += "    init=true;\n"
  header += "    b = a.pop if y # == '';\n"
  header += '    y ?   tmp1 = "Fraction(Zahlen(#{b.at(0)}),Quotient(#{b.at(1)},#{b.at(2)}))" : tmp1 = "&&&&"'
  header += "\n"
  header += "    tmp0 = \"\";\n"
  header += "    a.reverse.each{|x|;\n"
  header += "      break if x.nil?;\n"
  header += '      tmp0 = "Fraction(Zahlen(#{x.at(0)}),Quotient(Zahlen(#{x.at(1)}),(#{tmp1})))"'
  header += "\n"
  header += "      tmp1 = tmp0;\n"
  header += "      tmp0 = \"\"};\n"
  header += "    tmp1;\n"
  header += "  end;\n"
  header += "  end;\n"
  ret = ""
  (rstart..itter).each{|x|
    if x==1 then
      ret += "  tmp#{x}even = \"[0,16]\";\n" if x==1
      ret += "  tmp#{x}odd =  \"[0,4]\";\n" if x==1
    else
      ret += "  tmp#{x}even = \"\";\n"
      ret += "  tmp#{x}odd = \"\";\n"
    end
    if x==1 then
      ret += "  (1..#{x*1000}).to_a.each{|n|;\n"
#      ret += "    tmp#{x}even << \"[\" + (5*(2*n-1)).to_s + \",\" + (n*n).to_s + \"]\" if n== 1;\n"
#      ret += "    tmp#{x}odd << \"[\" + (239 + ((n-1)*478)).to_s + \",\" + (n*n).to_s + \"]\" if n== 1;\n"
      ret += "    tmp#{x}even << \",[\" + (5*(2*n-1)).to_s + \",\" + (n*n).to_s + \"]\" # unless n==1;\n"
      ret += "    tmp#{x}odd << \",[\" + (239 + ((n-1)*478)).to_s + \",\" + (n*n).to_s + \"]\"# unless n==1;\n"
      ret += "};\n"
    else
      ret += "(#{((x-1)*1000)+1}..#{x*1000}).to_a.each{|n|;\n"
      ret += " tmp#{x}even << \"[\" + (5*(2*n-1)).to_s + \",\" + (n*n).to_s + \"]\" if n== #{((x-1)*1000)+1};\n"
      ret += " tmp#{x}odd << \"[\" + (239 + ((n-1)*478)).to_s + \",\" + (n*n).to_s + \"]\"if n== #{((x-1)*1000)+1};\n"
      ret += " tmp#{x}even << \",[\" + (5*(2*n-1)).to_s + \",\" + (n*n).to_s + \"]\" unless n==#{((x-1)*1000)+1};\n"
      ret += " tmp#{x}odd << \",[\" + (239 + ((n-1)*478)).to_s + \",\" + (n*n).to_s + \"]\" unless n== #{((x-1)*1000)+1};\n"
      ret += "};\n"
    end
    ret += ";\n"
    ret += "tmp#{x}even =  \"[\" + tmp#{x}even + \"]\";\n"
    ret += "tmp#{x}odd =  \"[\" + tmp#{x}odd + \"]\";\n"
    ret += ";\n"
    tmp1 << ret
  }
  ret = header
  first = true
  (rstart..itter).to_a.reverse.each{|x|
    ret += tmp1.pop  
    ret += "a0 = eval(Kettenbruch::allseitigfactory(eval(tmp#{x}even)));\n" if first
    ret += "a1 = eval(Kettenbruch::allseitigfactory(eval(tmp#{x}even),a0));\n" unless first
    ret += "a0 = a1;\n\n" unless first
    first = false
#  }
  ret += " c = a1;\n" if x == rstart
#  first = true
#  (rstart..itter).to_a.reverse.each{|x|
    ret += "a0 = eval(Kettenbruch::allseitigfactory(eval(tmp#{x}odd )));\n" if first
    ret += "a1 = eval(Kettenbruch::allseitigfactory(eval(tmp#{x}odd),a0));\n" unless first
    ret += "a0 = a1;\n\n" unless first
    first = false
  } 
#  ret += "p tmp1even;\n"
  ret += "d = a1;\n"
  ret += "p z = c - d;\n"
  ret += "p z.to_Dec;\n"
  ret += "z6 = Time::now;\n"
  
  ret += "p \"PI calc time is \#{z6-z5} \";\n"
  ret
end

run = piPart(1,2)
print run
run
