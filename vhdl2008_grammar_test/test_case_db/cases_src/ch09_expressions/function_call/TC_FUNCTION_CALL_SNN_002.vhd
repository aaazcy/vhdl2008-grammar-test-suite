-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Test Focus: SNN: missing required actual parameter — f_add(a) provides only 1 argument but the function definition requires 2 parameters
-- Expected Result: Triggers semantic error: actual parameter count does not match formal parameter count
-- Dependencies: None
-- =============================================================

entity ent_fc_snn_002 is
  port (a, b : in integer);
end entity ent_fc_snn_002;

architecture missing_actual of ent_fc_snn_002 is
  function f_add(x, y : integer) return integer is
  begin return x + y; end function;
  signal s : integer;
begin
  -- ERROR: Missing required actual parameter — f_add needs 2 parameters
  s <= f_add(a);
end architecture missing_actual;
