-- =============================================================
-- Case ID: TC_GENERATE_STATEMENT_BODY_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_STATEMENT_BODY
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_statement_body ::= [ block_declarative_part begin ] { concurrent_statement } [ end [ alternative_label ] ; ]
-- Case Type: Negative
-- Test Focus: generate_statement_body: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generate_statem_e2 is end entity;
architecture bh of generate_statem_e2 is
  -- ERROR: invalid syntax in generate_statement_body
  signal s : bit;
begin
  s <= '1'
end architecture bh;