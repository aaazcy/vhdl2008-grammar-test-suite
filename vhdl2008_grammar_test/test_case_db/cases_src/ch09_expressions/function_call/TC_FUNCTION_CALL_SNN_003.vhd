-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Test Focus: SNN: extra actual parameters — f_add(a, b, c) provides 3 arguments but the function definition requires only 2
-- Expected Result: Triggers semantic error: too many actual parameters for function
-- Dependencies: None
-- =============================================================

entity ent_fc_snn_003 is
  port (a, b, c : in integer);
end entity ent_fc_snn_003;

architecture extra_actual of ent_fc_snn_003 is
  function f_add(x, y : integer) return integer is
  begin return x + y; end function;
  signal s : integer;
begin
  -- ERROR: Extra actual parameter — f_add expects exactly 2 parameters
  s <= f_add(a, b, c);
end architecture extra_actual;
