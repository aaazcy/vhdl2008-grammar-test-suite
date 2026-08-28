-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Rule Description: Multiple concurrent signal assignments to the same resolved signal in a block statement part create multiple drivers — the resolution function determines the effective value
-- Case Type: Positive
-- Test Focus: two concurrent signal assignments inside a block drive the same resolved signal s_resolved — verifying that multiple concurrent assignments in one declaration region of block_statement_part create multiple drivers, with the resolution function combining the driven values
-- Expected Result: Compiles successfully; s_resolved has two drivers resolved by "and" function
-- Dependencies: None
-- =============================================================
entity blk_part_sem2_ent is
  port(a, b : in bit; y : out bit);
end entity blk_part_sem2_ent;
architecture bh of blk_part_sem2_ent is
  function and_resolve(v : bit_vector) return bit is
    variable r : bit := '1';
  begin
    for i in v'range loop r := r and v(i); end loop;
    return r;
  end function and_resolve;
  subtype resolved_bit is and_resolve bit;
  signal s_resolved : resolved_bit;
begin
  blk_drv : block is
  begin
    s_resolved <= a;
    s_resolved <= b;
    y <= s_resolved;
  end block blk_drv;
end architecture bh;
