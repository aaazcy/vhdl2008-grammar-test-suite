-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: named association: f(x => a, y => b) form passes actual parameters using named association, verifying named association syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_named is
  port (
    v1, v2 : in  integer;
    y      : out integer
  );
end entity ent_fc_named;

architecture named_assoc of ent_fc_named is
  function f_mul(a, b : integer) return integer is
  begin
    return a * b;
  end function;
begin
  y <= f_mul(a => v1, b => v2);
end architecture named_assoc;
