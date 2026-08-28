-- =============================================================
-- Case ID: TC_SEQUENCE_OF_STATEMENTS_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENCE_OF_STATEMENTS
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequence_of_statements ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: SNN: EOF-truncated sequence — after `v:=a+b;` missing semicolon going straight to end process, the trailing statement is not properly terminated
-- Expected Result: Triggers syntax error: unexpected 'end', missing ';'
-- Dependencies: None
-- =============================================================
entity sos_snn5_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sos_snn5_ent is
begin
  process(a,b) is
    variable v : integer;
  begin
    v := a + b
    y <= v
  end process;
end architecture bh;
