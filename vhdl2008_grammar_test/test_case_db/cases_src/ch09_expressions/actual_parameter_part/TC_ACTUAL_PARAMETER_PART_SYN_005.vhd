-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Test Focus: Empty actual parameter list (call of a parameterless function) - when calling a parameterless function actual_parameter_part may be omitted, but empty parentheses after the function name is also an optional legal form (verified for completeness)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_no_params is
  port (
    y_o : out integer
  );
end entity ent_no_params;

architecture rtl of ent_no_params is
  function answer return integer is
  begin return 42; end function;
begin
  y_o <= answer;
end architecture rtl;
