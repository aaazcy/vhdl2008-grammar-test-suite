-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Test Focus: Mixed positional and named actuals - a legal mixed association with positional first and named second, verifying the correct ordering syntax of positional parameters before named parameters in actual_parameter_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_mixed_params is
  port (
    a_i : in  integer;
    b_i : in  integer;
    c_i : in  integer;
    y_o : out integer
  );
end entity ent_mixed_params;

architecture rtl of ent_mixed_params is
  function calc(x, y, z : integer) return integer is
  begin return x + y - z; end function;
begin
  y_o <= calc(a_i, b_i, z => c_i);
end architecture rtl;
