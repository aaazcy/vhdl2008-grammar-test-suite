-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_configura_e3 is end entity;
architecture bh of block_configura_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;