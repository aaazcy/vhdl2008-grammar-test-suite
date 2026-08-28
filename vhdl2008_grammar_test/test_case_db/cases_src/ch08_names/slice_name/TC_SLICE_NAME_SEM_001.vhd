-- =============================================================
-- Case ID: TC_SLICE_NAME_SNM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SLICE_NAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Positive
-- Rule Description: In a slice_name the bounds specified by the discrete_range must lie within the index range of the prefix, and the directions of the types must be compatible
-- Test Focus: Semantic positive case——s_vec(5 downto 2) lies within the declared range of s_vec(7 downto 0) with the same downto direction, legal slice semantics
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity slice_valid_sem is
  port(din : in bit_vector(7 downto 0);
       part : out bit_vector(3 downto 0));
end entity;

architecture vhdl2008 of slice_valid_sem is
  signal buf : bit_vector(7 downto 0) := (others => '0');
begin
  process(din)
  begin
    buf <= din;
    part <= buf(5 downto 2);
  end process;
end architecture vhdl2008;
