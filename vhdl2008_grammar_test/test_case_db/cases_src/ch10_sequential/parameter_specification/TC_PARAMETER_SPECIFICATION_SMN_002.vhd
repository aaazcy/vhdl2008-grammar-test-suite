-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_PARAM_SPEC_HIDDEN
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Negative
-- Test Focus: SMN: loop parameter hides outer variable of the same name — outer declares variable i, inner for i hides outer i, making outer i invisible
-- Expected Result: Triggers semantic warning: loop parameter hides outer declaration
-- Dependencies: None
-- =============================================================
entity ps_smn2_ent is port(y:out integer); end entity;
architecture bh of ps_smn2_ent is
begin
  process is
    variable i : integer := 10;
    variable v : integer := 0;
  begin
    for i in 0 to 7 loop
      v := v + i;
    end loop;
    y <= i + v;
    wait;
  end process;
end architecture bh;
