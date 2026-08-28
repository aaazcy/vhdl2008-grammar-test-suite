-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement_part ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: process_statement_part: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity process_stateme_e3 is end entity;
architecture bh of process_stateme_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;