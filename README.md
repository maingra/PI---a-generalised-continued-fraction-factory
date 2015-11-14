# PI---a-generalised-continued-fraction-factory
Using M500 extended numbers - generalised continued fraction to calculate PI or π

requirements
------------

NB requires Ruby programming language
https://www.ruby-lang.org/en/

NB requires 'm500' # Extended number ruby library <br>
type at prompt <br>
  :> gem install M500 <br>
M500 is a powerful new library of number objects.<br>
A mathematics library designed to minimize my surprise when working with maths and analysis.<br>
M500 users are freed from technical issues and can concentrate on the Math.<br>
documentation: https://sites.google.com/site/m500numbers/

Background
----------
Machin-like formulae are very fast techniques for computing π.<br>
π calculations are useful for testing computer systems<br>

What the code does
------------------
The ruby code is a Template metaprogramming (TMP) file to output a calculation π using M500 number objects<br>
Specifically the Generalized continued fraction<br>
(see https://en.wikipedia.org/wiki/Generalized_continued_fraction) M500 number object.

To use
------
type at prompt<br>
  :> ruby pi-gcff_TMP.rb >> output.rb<br>
then type<br>
  :> ruby output.rb

Warning
-------
Running this output file will be compute intensive



