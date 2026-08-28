-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Test Focus: SNN: wrong named association parameter name — "z" in f_add(z => a, y => b) is not a formal parameter name of the function declaration
-- Expected Result: Triggers semantic error: named association 'z' does not correspond to any formal parameter
-- Dependencies: None
-- =============================================================

entity ent_fc_snn_004 is
  port (a, b : in integer);
end entity ent_fc_snn_004;

architecture wrong_name of ent_fc_snn_004 is
  function f_add(x, y : integer) return integer is
  begin return x + y; end function;
  signal s : integer;
begin
  -- ERROR: Wrong formal parameter name 'z' in named association
  s <= f_add(z => a, y => b);
end architecture wrong_name;
