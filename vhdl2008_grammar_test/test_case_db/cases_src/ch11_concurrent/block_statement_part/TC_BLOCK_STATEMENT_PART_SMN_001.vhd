-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_BLOCK_PART_PORT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Rule Description: Block statement part concurrent statements must be valid
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: incompatible concurrent assignment types in block
-- Expected Result: Triggers semantic error: type mismatch in block
-- Dependencies: None
-- =============================================================
entity block_part_smn1_ent is port(y:out integer); end entity;
architecture bh of block_part_smn1_ent is
begin
  b1: block is
    signal s_i:integer:=0;
  begin
    s_i <= '1';
    y<=s_i;
  end block;
end architecture bh;
