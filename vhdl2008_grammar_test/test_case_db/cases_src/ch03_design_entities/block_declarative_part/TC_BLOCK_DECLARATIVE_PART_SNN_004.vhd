-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: constant_declaration in the block declarative part missing the ":=" assignment operator — the constant has only a type and no initialization value, verifying that := is a required marker in constant_declaration
-- Expected Result: Triggers syntax error: ":=" expected in constant declaration
-- Dependencies: None
-- =============================================================
entity bdp_snn4_ent is
  port(x : in integer; y : out integer);
end entity;
architecture bh of bdp_snn4_ent is
begin
  b_bad : block
    constant C_BAD : integer;
    signal s : integer := 0;
  begin
    s <= x;
    y <= s;
  end block;
end architecture bh;
