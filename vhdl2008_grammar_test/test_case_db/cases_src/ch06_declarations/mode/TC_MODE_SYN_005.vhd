-- =============================================================
-- Case ID: TC_MODE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Positive
-- Test Focus: Exercises linkage mode as a pass-through monitoring port in a debug wrapper entity.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mode_linkage_debug is
  port (
    core_in    : in      bit_vector(7 downto 0);
    core_out   : out     bit_vector(7 downto 0);
    debug_mon  : linkage bit_vector(7 downto 0)
  );
end entity mode_linkage_debug;

architecture rtl of mode_linkage_debug is
begin
  core_out <= core_in;
end architecture rtl;
