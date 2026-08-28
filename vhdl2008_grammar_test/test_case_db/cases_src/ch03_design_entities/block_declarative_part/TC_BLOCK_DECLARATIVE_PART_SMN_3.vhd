-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SEM: constant in the block declarative part references an undefined type — the constant type is a custom type that is not declared in the declarative part
-- Expected Result: Triggers semantic error: undeclared type in constant declaration
-- Dependencies: None
-- =============================================================
entity bdp_sem2_ent is
  port(x : in integer; y : out integer);
end entity;
architecture bh of bdp_sem2_ent is
begin
  b_bad : block
    constant C_REF : t_undefined := 0;
  begin
    y <= x;
  end block;
end architecture bh;
