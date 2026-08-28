-- =============================================================
-- Case ID: TC_SLICE_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Positive
-- Test Focus: slice_name ascending slice——s_vec(0 to 7) uses an ascending discrete_range (to direction), verifying that slice_name supports the range slice syntax in the to direction
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity slice_asc_range is
  port(din : in bit_vector(0 to 15);
       upper_byte : out bit_vector(0 to 7);
       lower_byte : out bit_vector(0 to 7));
end entity;

architecture vhdl2008 of slice_asc_range is
  signal buf : bit_vector(0 to 15) := (others => '0');
begin
  process(din)
  begin
    buf <= din;
    upper_byte <= buf(0 to 7);
    lower_byte <= buf(8 to 15);
  end process;
end architecture vhdl2008;
