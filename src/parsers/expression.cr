module Mint
  class Parser
    def expression!(error : SyntaxError.class) : Ast::Expression
      raise error unless exp = expression
      exp
    end

    def array_access_or_call(lhs)
      case char
      when '('
        call(lhs)
      when '['
        array_access(lhs)
      else
        lhs
      end
    end

    def expression : Ast::Expression | Nil
      return unless left = basic_expression

      # Handle array access
      left = array_access_or_call(left)

      if operator = self.operator
        rollup_pipe operation(left, operator)
      else
        left
      end
    end
  end
end
