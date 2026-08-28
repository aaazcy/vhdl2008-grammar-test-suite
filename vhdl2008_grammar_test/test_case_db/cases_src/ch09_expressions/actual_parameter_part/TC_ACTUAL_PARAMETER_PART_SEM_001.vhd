-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ACTUAL_PARAMETER_PART_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Rule Description: Actual parameters must match the formal parameters in type, mode compatibility, and number. Positional associations are resolved by position; named associations by name.
-- Test Focus: Type and mode matching semantics of actual parameters against formal parameters - using integer and bit types to receive and return parameters, verifying the rule that actual parameter list types must match the formal parameter declarations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_sem_type_match is
  port (
    a_i : in  integer;
    b_i : in  bit;
    y_o : out integer
  );
end entity ent_sem_type_match;

architecture rtl of ent_sem_type_match is
  function scale(val : integer; en : bit) return integer is
  begin
    if en = '1' then return val * 2; else return 0; end if;
  end function;
begin
  y_o <= scale(a_i, b_i);
end architecture rtl;
