-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement_part ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: process_statement_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity process_stateme_e2 is end entity;
architecture bh of process_stateme_e2 is
  -- ERROR: invalid syntax in process_statement_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;