-- =============================================================
-- Case ID: TC_CHOICE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: element_simple_name as a choice: the identifiers ADD/SUB/MUL/DIV of enumeration type t_op are used directly as choices in a case statement, without any qualification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ch_elem_name is
  port (
    opcode : in  integer range 0 to 3;
    result : out integer
  );
end entity ch_elem_name;

architecture alu_decode of ch_elem_name is
  type t_op is (ADD, SUB, MUL, DIV);
  signal s_op : t_op;

  function to_op(code : integer) return t_op is
  begin
    case code is
      when 0 => return ADD;
      when 1 => return SUB;
      when 2 => return MUL;
      when 3 => return DIV;
      when others => return ADD;
    end case;
  end function;
begin
  s_op <= to_op(opcode);

  process(s_op)
    constant A : integer := 10;
    constant B : integer := 5;
  begin
    case s_op is
      when ADD => result <= A + B;   -- element_simple_name choice
      when SUB => result <= A - B;
      when MUL => result <= A * B;
      when DIV => result <= A / B;
    end case;
  end process;
end architecture alu_decode;
