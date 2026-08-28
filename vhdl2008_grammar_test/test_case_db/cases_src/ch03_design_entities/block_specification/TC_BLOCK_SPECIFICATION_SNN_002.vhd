-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: block_specification: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_specifica_e2 is end entity;
architecture bh of block_specifica_e2 is
  -- ERROR: invalid syntax in block_specification
  signal s : bit;
begin
  s <= '1'
end architecture bh;