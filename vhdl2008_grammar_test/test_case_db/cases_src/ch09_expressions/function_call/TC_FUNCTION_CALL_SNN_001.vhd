-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Test Focus: SNN: missing ")" — f_add(a, b lacks the closing right parenthesis, verifying that the actual parameter part must be closed with )
-- Expected Result: Triggers syntax error: missing closing ')' in function call
-- Dependencies: None
-- =============================================================

entity ent_fc_snn_001 is
  port (a, b : in integer);
end entity ent_fc_snn_001;

architecture miss_paren of ent_fc_snn_001 is
  function f_add(x, y : integer) return integer is
  begin return x + y; end function;
  signal s : integer;
begin
  -- ERROR: Missing closing ')' in actual parameter part
  s <= f_add(a, b;
end architecture miss_paren;
