-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: SMN: block header generic_map provides an out-of-range value — the generic declares range 0 to 7 but generic_map provides the value 10
-- Expected Result: Triggers semantic error: generic value out of range
-- Dependencies: None
-- =============================================================
entity bhdr_smn2_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit);
end entity;
architecture bh of bhdr_smn2_ent is
begin
  b_bad : block
    generic(BIT_SEL : integer range 0 to 7 := 0);
    generic map(BIT_SEL => 10);
  begin
    dout <= din(BIT_SEL);
  end block;
end architecture bh;
