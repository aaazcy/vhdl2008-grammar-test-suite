-- =============================================================
-- Case ID: TC_INDEXED_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Negative
-- Test Focus: SNN: missing comma separator in a multidimensional index — in s_mat(1 2) the ',' between the two expressions is missing; the multi-expression form of indexed_name requires expression { , expression } separated by commas
-- Expected Result: Triggers syntax error at missing comma
-- Dependencies: None
-- =============================================================
entity idx_name_miss_comma is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of idx_name_miss_comma is
  type t_mat is array(0 to 3, 0 to 3) of integer;
  signal s_mat : t_mat := (others => (others => 0));
begin
  -- ERROR: Missing ',' between index expressions in 2D array access
  q <= '1' when s_mat(1 2) = 5 else '0';
end architecture vhdl2008;
