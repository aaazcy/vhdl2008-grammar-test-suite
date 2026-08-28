-- =============================================================
-- Case ID: TC_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.1
-- Production: name ::= simple_name | operator_symbol | character_literal | selected_name | indexed_name | slice_name | attribute_name | external_name
-- Case Type: Positive
-- Test Focus: operator_symbol and character_literal as name forms — operator_symbol ("+") and character_literal ('A') used as names via alias declarations, exercising the operator_symbol and character_literal alternatives
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity name_op_char_ent is
  port(a : in integer; b : in integer; sum : out integer; tag : out character);
end entity;

architecture bh of name_op_char_ent is
  alias plus_op is "+"[integer, integer return integer];  -- operator_symbol as name
  constant my_tag : character := 'A';
  alias char_A is my_tag;  -- character_literal referenced via constant
  signal a_reg, b_reg : integer := 0;
  signal sum_reg : integer := 0;
begin
  process(a, b)
  begin
    a_reg <= a; b_reg <= b;
    sum_reg <= plus_op(a_reg, b_reg);  -- operator_symbol used as function name
  end process;
  sum <= sum_reg;
  tag <= my_tag;  -- character_literal constant used as name
end architecture bh;
