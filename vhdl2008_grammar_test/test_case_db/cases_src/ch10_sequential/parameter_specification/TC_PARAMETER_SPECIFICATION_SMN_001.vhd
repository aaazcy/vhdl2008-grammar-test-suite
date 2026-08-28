-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_PARAM_SPEC_RANGE
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Rule Description: Loop parameter range bounds must have same discrete type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: for loop with mixed range types (integer low, bit_vector high)
-- Expected Result: Triggers semantic error: range bounds type mismatch
-- Dependencies: None
-- =============================================================
entity param_spec_smn1_ent is port(y:out integer); end entity;
architecture bh of param_spec_smn1_ent is
begin
  process is
    variable v:integer:=0;
  begin
    for i in 0 to v'length loop
      v := v+1;
    end loop;
    y<=v; wait;
  end process;
end architecture bh;
