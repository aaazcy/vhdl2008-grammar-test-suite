-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: incomplete type_declaration in the block declarative part — no identifier and no definition after the type keyword, verifying that the BNF of type_declaration requires an identifier and a type definition
-- Expected Result: Triggers syntax error: incomplete type declaration
-- Dependencies: None
-- =============================================================
entity bdp_snn5_ent is
  port(a : in bit; y : out bit);
end entity;
architecture bh of bdp_snn5_ent is
begin
  b_bad : block
    type ;
    signal s : bit := a;
  begin
    y <= s;
  end block;
end architecture bh;
