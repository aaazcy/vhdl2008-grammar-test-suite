-- =============================================================
-- Case ID: TC_INDEXED_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEXED_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: indexed_name ::= prefix ( expression { , expression } )
-- Case Type: Positive
-- Test Focus: Minimal one-dimensional array index form — s_data(0) indexes a bit_vector signal directly to access a single element, verifying the minimal single-expression syntax (prefix ( expression )) of indexed_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity idx_name_1d_min is
  port(din : in bit_vector(7 downto 0); lsb : out bit);
end entity;

architecture vhdl2008 of idx_name_1d_min is
  signal buf : bit_vector(7 downto 0) := (others => '0');
begin
  process(din)
  begin
    buf <= din;
    lsb <= buf(0);
  end process;
end architecture vhdl2008;
