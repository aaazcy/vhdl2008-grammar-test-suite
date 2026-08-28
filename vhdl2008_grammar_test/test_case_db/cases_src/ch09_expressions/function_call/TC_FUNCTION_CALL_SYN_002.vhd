-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: single-parameter positional association: f_add(a) form passes a single actual parameter by positional association, verifying the simplest function_call with parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_single is
  port (
    x : in  integer;
    y : out integer
  );
end entity ent_fc_single;

architecture single_param of ent_fc_single is
  function f_dbl(n : integer) return integer is
  begin
    return n * 2;
  end function;
begin
  y <= f_dbl(x);
end architecture single_param;
