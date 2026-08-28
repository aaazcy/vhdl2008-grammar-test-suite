-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: SNN: Sequential statement directly used as concurrent_statement - a variable_assignment statement (:= assignment operator) appears in the architecture statement part, variable_assignment is a sequential_statement rather than a concurrent_statement and must be wrapped inside a process, verifying a non-concurrent statement is illegal in the architecture statement part
-- Expected Result: Triggers syntax error: sequential statement not allowed as concurrent statement
-- Dependencies: None
-- =============================================================
entity asp_snn5_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of asp_snn5_ent is
  signal s_result:integer:=0;
begin
  s_result:=a+b;
  y<=s_result;
end architecture bh;
