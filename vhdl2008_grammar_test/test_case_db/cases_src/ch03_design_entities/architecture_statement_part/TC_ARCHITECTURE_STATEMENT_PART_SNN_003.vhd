-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.3
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: architecture_statement_part: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity architecture_st_e3 is end entity;
architecture bh of architecture_st_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;