-- =============================================================
-- Case ID: TC_INDEXED_NAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Negative
-- Test Focus: SNN: missing left parenthesis — in s_arr 0) the prefix is directly followed by a space and an expression without the required '(' left parenthesis; indexed_name requires '(' immediately after the prefix
-- Expected Result: Triggers syntax error at missing '('
-- Dependencies: None
-- =============================================================
entity idx_name_miss_lparen is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of idx_name_miss_lparen is
  type t_arr is array(0 to 3) of bit;
  signal s_arr : t_arr := (others => '0');
begin
  -- ERROR: Missing '(' before index expression
  q <= s_arr 0);
end architecture vhdl2008;
