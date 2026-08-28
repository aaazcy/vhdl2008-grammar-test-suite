-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_configura_e2 is end entity;
architecture bh of block_configura_e2 is
  -- ERROR: invalid syntax in block_configuration
  signal s : bit;
begin
  s <= '1'
end architecture bh;