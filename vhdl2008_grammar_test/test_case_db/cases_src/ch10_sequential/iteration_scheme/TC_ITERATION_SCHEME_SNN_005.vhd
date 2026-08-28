-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Negative
-- Test Focus: SNN: while condition contains an illegal operator — `while v := 0 loop` uses `:=` (assignment) instead of `=` (equality), in VHDL `:=` is variable assignment, not a boolean condition
-- Expected Result: Triggers syntax error: invalid condition expression
-- Dependencies: None
-- =============================================================
entity iter_snn5_ent is port(a,b:in integer); end entity;
architecture bh of iter_snn5_ent is
begin
  process(a,b) is
    variable v : integer := 10;
  begin
    while v := 0 loop
      v := v - 1;
    end loop;
    wait;
  end process;
end architecture bh;
