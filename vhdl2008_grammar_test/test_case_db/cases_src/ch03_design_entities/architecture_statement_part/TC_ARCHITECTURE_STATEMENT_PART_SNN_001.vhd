-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: SNN: Sequential statement in a concurrent context - an if-then-else is placed directly in the architecture body (not inside a process), verifying a sequential_statement cannot appear directly as a concurrent_statement
-- Expected Result: Triggers syntax error: sequential statement not allowed in concurrent context
-- Dependencies: None
-- =============================================================
entity asp_snn1_ent is port(a,b:in bit; y:out bit); end entity;
architecture bh of asp_snn1_ent is
begin
  if a='1' then y<=b; else y<='0'; end if;
end architecture bh;
