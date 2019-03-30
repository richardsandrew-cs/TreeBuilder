class Scanner
    def initialize(filename)
       @f = File.open(filename,'r:utf-8')
       if (! @f.eof?)
          @c = @f.getc()
       else
          @c = "!eof!"
          @f.close()
       end
    end
    
    def nextCh()
       ch = @c
       if (! @f.eof?)
          @c = @f.getc()
       else
          @c = "!eof!"
       end
       return ch
    end
    
    def nextToken()
      if @c == "!eof!"
         return Token.new(Token::EOF,"!eof!")
      end
      if (whitespace?(@c))
         str =""
         while whitespace?(@c)
            str += @c
            nextCh()
         end
         tok = Token.new(Token::WS,str)
         return tok
      elsif(letter?(@c))
      ch = ""
        while(letter?(@c))
          ch += @c
          nextCh()
        end
        if(ch =~ /print/)
          return Token.new(Token::PRINT, "")
        elsif(ch =~ /if/)
          return Token.new(Token::IF, "")
        elsif(ch =~ /end/)
          return Token.new(Token::EN, "")
        else
          return Token.new(Token::ID, ch)
        end
      elsif(numeric?(@c))
        ch = ""
        while(numeric?(@c))
          ch += @c
          nextCh()
        end
        return Token.new(Token::INT, ch)
      elsif(@c == '(')
        nextCh()
        return Token.new(Token::LPAREN, "")
      elsif(@c == ')')
        nextCh()
        return Token.new(Token::RPAREN, "")
      elsif(@c == '+')
        nextCh
        return Token.new(Token::ADDOP, "")
      elsif(@c == '-')
        nextCh()
        return Token.new(Token::SUBOP, "")
      elsif(@c == '*')
        nextCh()
        return Token.new(Token::MULTOP, "")
      elsif(@c == '/')
        nextCh()
        return Token.new(Token::DIVOP, "")
      elsif(@c == '=')
        nextCh()
        return Token.new(Token::ASGN, "")
      else #more work here!
        ch = @c
        nextCh()
        return Token.new(Token::UNKNWN,ch)
      end
    end
  end
  def letter?(ch)
    ch =~ /^[a-z]|[A-Z]$/
  end
  
  def numeric?(ch)
    ch =~ /^(\d)+$/
  end
  
  def whitespace?(ch)
    ch =~ /^(\s)+$/
  end