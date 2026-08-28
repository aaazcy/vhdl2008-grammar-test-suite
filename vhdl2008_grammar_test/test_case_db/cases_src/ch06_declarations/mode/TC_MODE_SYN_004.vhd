-- =============================================================
-- Case ID: TC_MODE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Positive
-- Test Focus: Exercises inout mode with a bidirectional tristate bus, controlled by an output enable signal.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mode_inout_bus is
  port (
    oe        : in    bit;
    data_bus  : inout bit_vector(7 downto 0);
    tx_data   : in    bit_vector(7 downto 0);
    rx_data   : out   bit_vector(7 downto 0)
  );
end entity mode_inout_bus;

architecture rtl of mode_inout_bus is
begin
  data_bus <= tx_data when oe = '1' else (others => '0');
  rx_data  <= data_bus;
end architecture rtl;
