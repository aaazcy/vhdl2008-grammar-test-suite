-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: alias_declaration in the block declarative part references an undeclared object — the alias points to a nonexistent identifier, verifying that the alias target must be visible in the current scope
-- Expected Result: Triggers semantic error: alias target not found
-- Dependencies: None
-- =============================================================
entity bdp_snn6_ent is
  port(d : in bit; q : out bit);
end entity;
architecture bh of bdp_snn6_ent is
begin
  b_bad : block
    alias a_bad is nonexistent_signal;
    signal s : bit := d;
  begin
    q <= s;
  end block;
end architecture bh;
