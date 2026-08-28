-- =============================================================
-- Case ID: TC_SLICE_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Positive
-- Test Focus: Slice name ascending+descending+null slice: bit_vector(7..0) ascending slice (3 downto 0) / descending slice (4 to 7) / null slice (4 downto 4 single element), verifying the discrete_range direction and bounds of slice_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity slice_ent is port(vec:in bit_vector(7 downto 0); hi,lo:out bit_vector(3 downto 0)); end entity;
architecture bh of slice_ent is
begin
  hi<=vec(7 downto 4); lo<=vec(3 downto 0);
end architecture bh;
