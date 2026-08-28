-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Negative
-- Test Focus: SNN: named association uses a nonexistent formal parameter name - in "func(z => a_i)" z is not a formal parameter name of the function, verifying that the formal name in named association must match a formal parameter identifier in the function definition
-- Expected Result: Triggers semantic error: no formal parameter named "z" in function
-- Dependencies: None
-- =============================================================
entity ent_snn_bad_name is
  port (
    a_i : in  integer;
    y_o : out integer
  );
end entity ent_snn_bad_name;

architecture rtl of ent_snn_bad_name is
  function double(x : integer) return integer is
  begin return x * 2; end function;
begin
  -- ERROR: no formal parameter named "z"
  y_o <= double(z => a_i);
end architecture rtl;
