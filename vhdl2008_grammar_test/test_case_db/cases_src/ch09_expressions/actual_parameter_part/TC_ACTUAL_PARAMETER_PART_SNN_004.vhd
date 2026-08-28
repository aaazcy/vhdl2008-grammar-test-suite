-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Negative
-- Test Focus: SNN: more actuals than formal parameters - "func(a_i, b_i)" passes two actuals to a single-parameter function, verifying that the number of actuals in actual_parameter_part must match the number of formals
-- Expected Result: Triggers semantic error: too many actual parameters
-- Dependencies: None
-- =============================================================
entity ent_snn_too_many is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_snn_too_many;

architecture rtl of ent_snn_too_many is
  function double(x : integer) return integer is
  begin return x * 2; end function;
begin
  -- ERROR: too many actual parameters (2 given, 1 expected)
  y_o <= double(a_i, b_i);
end architecture rtl;
