-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Positive
-- Test Focus: Enumeration literals used as choices in a case
--            statement with full coverage of all enum values.
--            Tests that each literal is a valid choice expression.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_lit_case_choices is
  port (
    sel  : in  integer range 0 to 3;
    dout : out integer
  );
end entity enum_lit_case_choices;
architecture rtl of enum_lit_case_choices is
  type t_op is (ADD, SUB, MUL, DIV);
  signal s_op : t_op := ADD;
  signal s_result : integer := 0;
begin
  process(sel)
  begin
    case sel is
      when 0 => s_op <= ADD;
      when 1 => s_op <= SUB;
      when 2 => s_op <= MUL;
      when 3 => s_op <= DIV;
    end case;
  end process;
  s_result <= 0 when s_op = ADD else 1 when s_op = SUB else 2;
  dout <= s_result;
end architecture rtl;
