-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon between statements — `s_a<=a s_b<=b` two signal assignments with no semicolon separating them
-- Expected Result: Triggers syntax error: missing ';' between sequential statements
-- Dependencies: None
-- =============================================================
entity sos_snn1_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sos_snn1_ent is
  signal s_a, s_b : integer := 0;
begin
  process(a,b) is
  begin
    s_a <= a s_b <= b;
    y <= s_a + s_b;
  end process;
end architecture bh;
