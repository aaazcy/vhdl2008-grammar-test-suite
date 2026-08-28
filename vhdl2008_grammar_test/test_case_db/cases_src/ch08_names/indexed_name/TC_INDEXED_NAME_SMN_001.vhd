-- =============================================================
-- Case ID: TC_INDEXED_NAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_INDEXED_NAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Negative
-- Rule Description: The number of index expressions in an indexed_name must match the number of array dimensions; extra index expressions cause an error
-- Error Category: Index dimensionality mismatch
-- Test Focus: SMN: a one-dimensional array indexed with two indexes — in s_arr(0, 1), s_arr is a one-dimensional array but two index expressions (comma-separated) are provided, a dimensionality mismatch
-- Expected Result: Triggers semantic error (index count does not match array dimensions)
-- Dependencies: None
-- =============================================================
entity idx_name_dim_mismatch is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of idx_name_dim_mismatch is
  type t_arr is array(0 to 7) of integer;
  signal s_arr : t_arr := (others => 0);
begin
  -- ERROR: 2 index expressions for a 1-dimensional array
  q <= '1' when s_arr(0, 1) = 5 else '0';
end architecture vhdl2008;
