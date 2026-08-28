-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: signal_declaration in the block declarative part missing the colon — the type name directly follows the signal name without a colon separator, verifying that ":" is a required syntactic marker of signal_declaration in the BNF
-- Expected Result: Triggers syntax error: ":" expected in signal declaration
-- Dependencies: None
-- =============================================================
entity bdp_snn1_ent is
  port(a : in bit; y : out bit);
end entity;
architecture bh of bdp_snn1_ent is
begin
  b_bad : block
    signal s_bad bit;
  begin
    y <= a;
  end block;
end architecture bh;
