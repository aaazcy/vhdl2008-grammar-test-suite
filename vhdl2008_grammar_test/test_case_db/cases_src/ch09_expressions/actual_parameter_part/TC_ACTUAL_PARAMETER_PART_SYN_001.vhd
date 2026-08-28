-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Test Focus: Minimal form: a single positional actual - the function call passes one integer actual, verifying the simplest parameter syntax of actual_parameter_part (the element_association form of parameter_association_list)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_simple_call is
  port (
    x_i : in  integer;
    y_o : out integer
  );
end entity ent_simple_call;

architecture rtl of ent_simple_call is
  function double(a : integer) return integer is
  begin return a * 2; end function;
begin
  y_o <= double(x_i);
end architecture rtl;
