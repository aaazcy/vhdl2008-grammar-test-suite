-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_PARAM_SPEC_IMMUTABLE
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Rule Description: Loop parameter is a constant within the loop body
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: assignment to loop parameter inside for loop
-- Expected Result: Triggers semantic error: loop parameter is constant
-- Dependencies: None
-- =============================================================
entity param_spec_sem1_ent is port(y:out integer); end entity;
architecture bh of param_spec_sem1_ent is
begin
  process is
  begin
    for i in 0 to 7 loop
      i := i+1;
    end loop;
    y<=0; wait;
  end process;
end architecture bh;
