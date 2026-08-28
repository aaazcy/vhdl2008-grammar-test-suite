-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: mixed positional and named association: f(a, c => v3) form uses positional association in front and named association after, verifying mixed parameter passing syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_mixed is
  port (
    p1, p2, p3 : in  integer;
    y          : out integer
  );
end entity ent_fc_mixed;

architecture mixed_assoc of ent_fc_mixed is
  function f_calc(a, b, c : integer) return integer is
  begin
    return a + b - c;
  end function;
begin
  y <= f_calc(p1, p2, c => p3);
end architecture mixed_assoc;
