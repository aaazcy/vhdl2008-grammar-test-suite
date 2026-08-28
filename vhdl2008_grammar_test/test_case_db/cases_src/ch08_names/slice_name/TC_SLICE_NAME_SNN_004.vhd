-- =============================================================
-- Case ID: TC_SLICE_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Negative
-- Test Focus: SNN: the discrete_range direction of the slice_name is incompatible with the declared direction of the prefix——in s_vec(0 to 3) the prefix is declared descending (7 downto 0) but the slice uses the ascending (to) direction
-- Expected Result: Triggers semantic error (direction mismatch)
-- Dependencies: None
-- =============================================================
entity slice_dir_mismatch is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of slice_dir_mismatch is
  signal s_vec : bit_vector(7 downto 0) := (others => '0');
begin
  -- ERROR: ascending slice on descending vector (null/empty range semantics)
  q <= s_vec(0 to 3)(0);
end architecture vhdl2008;
