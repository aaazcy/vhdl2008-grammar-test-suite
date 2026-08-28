-- =============================================================
-- Case ID: TC_INDEXED_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_INDEXED_NAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Positive
-- Rule Description: The number of index expressions in an indexed_name must match the dimensionality of the prefix array, and the type of each index expression must be compatible with the index type of the corresponding dimension
-- Test Focus: Positive semantic case — the three-dimensional array s_cube(x, y, z) is indexed with three integer expressions; the dimensionality matches the index count and the types are compatible (integer indexes for integer range dimensions)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity idx_name_3d_valid is
  port(x : in natural range 0 to 3;
       y : in natural range 0 to 3;
       z : in natural range 0 to 3;
       val_out : out integer);
end entity;

architecture vhdl2008 of idx_name_3d_valid is
  type t_cube is array(0 to 3, 0 to 3, 0 to 3) of integer;
  signal s_cube : t_cube := (others => (others => (others => 0)));
begin
  process(x, y, z)
  begin
    val_out <= s_cube(x, y, z);
  end process;
end architecture vhdl2008;
