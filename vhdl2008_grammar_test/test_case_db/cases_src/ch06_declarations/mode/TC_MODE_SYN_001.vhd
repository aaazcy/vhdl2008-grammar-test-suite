-- =============================================================
-- Case ID: TC_MODE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Positive
-- Test Focus: Exercises all five port modes (in, out, inout, buffer, linkage) through an entity with a comprehensive port list, each mode driving a distinct architecture behavior.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mode_all_five is
  port (
    data_in    : in    bit_vector(7 downto 0);
    data_out   : out   bit_vector(7 downto 0);
    data_bidir : inout bit_vector(7 downto 0);
    data_buf   : buffer bit_vector(7 downto 0);
    data_link  : linkage bit_vector(7 downto 0)
  );
end entity mode_all_five;

architecture rtl of mode_all_five is
  signal s_buf : bit_vector(7 downto 0);
begin
  data_out   <= data_in xor "10101010";
  data_bidir <= data_in when data_in(0) = '1' else (others => '0');
  s_buf      <= data_in when data_buf(7) = '0' else data_buf;
  data_buf   <= s_buf;
end architecture rtl;
