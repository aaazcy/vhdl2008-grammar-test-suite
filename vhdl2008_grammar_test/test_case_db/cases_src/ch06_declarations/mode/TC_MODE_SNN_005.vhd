-- =============================================================
-- Case ID: TC_MODE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Negative
-- Test Focus: ERROR: port declaration has two modes (in out) where the BNF only allows a single mode token.
-- Expected Result: Triggers syntax error (duplicate mode)
-- Dependencies: None
-- =============================================================
entity mode_snn5 is
  port (
    clk    : in     bit;
    duplex : in out bit_vector(7 downto 0)
  );
end entity mode_snn5;

architecture arch of mode_snn5 is
begin
end architecture arch;
