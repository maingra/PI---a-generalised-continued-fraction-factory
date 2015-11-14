# PI---a-generalised-continued-fraction-factory
Using M500 extended numbers - generalised continued fraction to calculate PI or π

requirements
------------

NB requires Ruby programming language
https://www.ruby-lang.org/en/

NB requires 'm500' # Extended number ruby library
type at prompt
>>gem install M500
M500 is a powerful new library of number objects.
A mathematics library designed to minimize my surprise when working with maths and analysis.
M500 users are freed from technical issues and can concentrate on the Math.
documentation: https://sites.google.com/site/m500numbers/

Background
----------
Machin-like formulae are very fast techniques for computing π.

π calculations are useful for testing computer systems

What the code does
------------------
The ruby code is a Template metaprogramming (TMP) file to output a calculation π using M500 number objects
Specifically the Generalized continued fraction (see https://en.wikipedia.org/wiki/Generalized_continued_fraction) M500 number object.

To use
------
type at prompt
>>ruby pi-gcff_TMP.rb >> output.rb
then type
>>ruby output.rb

Warning
-------
Running this output file will be compute intensive



