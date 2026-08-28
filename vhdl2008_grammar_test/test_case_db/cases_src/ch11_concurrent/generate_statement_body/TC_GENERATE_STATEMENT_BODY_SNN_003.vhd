-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Case Type: Negative
-- Test Focus: generate_statement_body: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generate_statem_e3 is end entity;
architecture bh of generate_statem_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;