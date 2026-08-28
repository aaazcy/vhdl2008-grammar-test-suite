-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_FUNCTION_CALL_TYPE_MATCH
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Rule Description: Each actual parameter in a function call must match the type of its corresponding formal parameter.
-- Test Focus: SEM: actual parameter type matches formal parameter type — f_add(integer, integer) call passes correct integer arguments, verifying the correct type match
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_sem_001 is
  port (
    x, y : in  integer;
    sum  : out integer
  );
end entity ent_fc_sem_001;

architecture type_match of ent_fc_sem_001 is
  function f_add(a, b : integer) return integer is
  begin
    return a + b;
  end function;
begin
  sum <= f_add(x, y);
end architecture type_match;
