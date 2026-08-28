-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_specification ::= architecture_name block_statement_label | generate_statement_label [ ( generate_specification ) ]
-- Case Type: Negative
-- Test Focus: block_specification: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_specifica_e3 is end entity;
architecture bh of block_specifica_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;