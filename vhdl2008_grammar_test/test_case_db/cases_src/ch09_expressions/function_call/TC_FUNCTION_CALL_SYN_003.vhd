-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: multi-parameter positional association: f_add(a, b) form maps multiple actual parameters to formal parameters in position order, verifying the multi-parameter positional association call
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_multi is
  port (
    a, b : in  integer;
    y    : out integer
  );
end entity ent_fc_multi;

architecture multi_param of ent_fc_multi is
  function f_add(x, y : integer) return integer is
  begin
    return x + y;
  end function;
begin
  y <= f_add(a, b);
end architecture multi_param;
