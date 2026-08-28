-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SMN: the generic type of the component declaration in the block declarative part does not match its default value — the generic is declared as time but the default value is an integer
-- Expected Result: Triggers semantic error: generic default value type mismatch
-- Dependencies: None
-- =============================================================
entity bdp_smn2_ent is
  port(clk : in bit; q : out bit);
end entity;
architecture bh of bdp_smn2_ent is
begin
  b_bad : block
    component dff is
      generic(DELAY : time := 5);
    end component;
  begin
    q <= clk;
  end block;
end architecture bh;
