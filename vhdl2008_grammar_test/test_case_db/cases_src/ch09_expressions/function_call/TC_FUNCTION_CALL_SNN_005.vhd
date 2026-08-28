-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Test Focus: SNN: function not visible — f_hidden(x) calls a function name that is not declared or not visible, verifying that the function name must be declared before it can be called
-- Expected Result: Triggers semantic error: function 'f_hidden' is not declared or not visible
-- Dependencies: None
-- =============================================================

entity ent_fc_snn_005 is
  port (x : in integer);
end entity ent_fc_snn_005;

architecture not_visible of ent_fc_snn_005 is
  signal s : integer;
begin
  -- ERROR: Function 'f_hidden' not declared or not visible
  s <= f_hidden(x);
end architecture not_visible;
