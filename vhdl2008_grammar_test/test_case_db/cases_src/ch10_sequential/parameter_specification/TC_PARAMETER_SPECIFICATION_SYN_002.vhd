-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Positive
-- Test Focus: descending discrete_range: `for i in 7 downto 0 loop` — identifier+in+downto range iterates in descending order
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_syn2_ent is port(y:out integer); end entity;
architecture bh of ps_syn2_ent is
begin
  process is
    variable v : integer := 0;
  begin
    for i in 7 downto 0 loop
      v := v + i;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
