-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: SNN: concurrent statement inside a process — `s_a <= s_b;` is concurrent outside a process, but inside a process `<=` would be treated as a signal assignment, and `s_a <= s_b;` is valid by itself. Changed to an inout parameter context error
-- Expected Result: Triggers syntax error: mode conflict or invalid context
-- Dependencies: None
-- =============================================================
entity sos_snn3_ent is port(y:out integer); end entity;
architecture bh of sos_snn3_ent is
  component fake_comp is port(x:out integer); end component;
begin
  process is
  begin
    fake_comp port map(y);
    wait;
  end process;
end architecture bh;
