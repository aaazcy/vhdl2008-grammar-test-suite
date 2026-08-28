-- =============================================================
-- Case ID: TC_MODE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Negative
-- Test Focus: ERROR: uses "input" as a mode which is not a valid VHDL mode. The BNF only allows in, out, inout, buffer, or linkage.
-- Expected Result: Triggers syntax error (invalid mode keyword)
-- Dependencies: None
-- =============================================================
entity mode_snn4 is
  port (
    clk  : in     bit;
    data : input  bit_vector(7 downto 0)
  );
end entity mode_snn4;

architecture arch of mode_snn4 is
begin
end architecture arch;
