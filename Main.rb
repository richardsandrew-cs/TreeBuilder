
load "Token.rb"
load "AST.rb"
load "Scanner.rb"
load "Parser.rb"

parse = Parser.new("input1.txt")
mytree = parse.program()
puts mytree.toStringList()