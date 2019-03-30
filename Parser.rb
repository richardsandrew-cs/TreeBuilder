class Parser < Scanner
    def initialize(filename)
       super(filename)
       consume()
    end
    def consume()
       @lookahead = nextToken()
       while(@lookahead.type == Token::WS)
         @lookahead = nextToken()
       end
    end
    def match(dtype)
       if (@lookahead.type != dtype)
          raise "Expected #{dtype} found #{@lookahead.type}"
       end
       consume()
    end
    def program()
       p = AST.new(Token::PGM)
       
       while( @lookahead.type != Token::EOF)
        p.addChild(statement())
       end
       return p
    end
    def statement()
      ast = AST.new(Token::STMT)
      if (@lookahead.type == Token::PRINT)
        ast.addChild(AST.new(@lookahead.type))
        match(Token::PRINT)
        ast.addChild(exp())
      elsif(@lookahead.type == Token::IF)
        
        ast.addChild(iff())
      else
        ast.addChild(assign())
      end
      return ast
    end
    
    def iff()
      ast = AST.new(Token::IF)
      
      
      return ast
    end
    
    def exp()
      ast = AST.new(Token::EXP)
      ast.addChild(term())
      ast.addChild(etail())
      return ast
    end
    
    def assign()
      ast = AST.new(Token::ASSIGN)
      if(@lookahead.type == Token::ID)
        ast.addChild(AST.new(@lookahead.text))
        match(Token::ID)
        match(Token::ASGN)
        ast.addChild(exp())
      else
        match(Token::UNKNWN)
      end
      
      return ast
      
    end
    
    def term()
      ast = AST.new(Token::TERM)
      ast.addChild(factor())
      ast.addChild(ttail())
      return ast
      
    end
    
    def etail()
      if(@lookahead.type !=  Token::ADDOP && @lookahead.type != Token::SUBOP)
        return nil
      end
      ast = AST.new(Token::ETAIL)
      ast.addChild(AST.new(@lookahead.type))
      match(@lookahead.type)
      ast.addChild(term())
      ast.addChild(etail())
      return ast
    end
 
   def factor()
     ast = AST.new(Token::FACTOR)
     if(@lookahead.type != Token::LPAREN)
       ast.addChild(AST.new(@lookahead.text))
       match(@lookahead.type)
       return ast
     end
     match(Token::LPAREN)
     ast.addChild(exp())
     if(@lookahead.type == Token::RPAREN)
       match(Token::RPAREN)
     else
       match(Token::UNKNWN)
     end
     return ast
   end
   
   def ttail()
     if(@lookahead.type !=  Token::MULTOP && @lookahead.type != Token::DIVOP)
        return nil
      end
      ast = AST.new(Token::TTAIL)
      ast.addChild(AST.new(@lookahead.type))
      match(@lookahead.type)
      ast.addChild(factor())
      ast.addChild(ttail())
      return ast
     
   end
 end