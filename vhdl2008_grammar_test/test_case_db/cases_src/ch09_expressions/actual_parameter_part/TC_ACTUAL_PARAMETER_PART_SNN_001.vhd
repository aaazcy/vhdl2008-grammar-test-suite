-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Negative
-- Test Focus: SNN: missing closing parenthesis - the function call "func(a_i" has an opening parenthesis with an argument but no closing parenthesis, verifying that actual_parameter_part parentheses must be closed
-- Expected Result: Triggers syntax error: missing closing ")" in actual_parameter_part
-- Dependencies: None
-- =============================================================
entity ent_snn_no_close is
  port (
    a_i : in  integer;
    y_o : out integer
  );
end entity ent_snn_no_close;

architecture rtl of ent_snn_no_close is
  function double(x : integer) return integer is
  begin return x * 2; end function;
begin
  -- ERROR: missing closing parenthesis
  y_o <= double(a_i;
end architecture rtl;
