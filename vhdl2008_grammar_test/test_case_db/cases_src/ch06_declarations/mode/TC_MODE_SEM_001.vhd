-- =============================================================
-- Case ID: TC_MODE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_MODE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: mode ::= in | out | inout | buffer | linkage
-- Case Type: Positive
-- Test Focus: Semantic validation: reading an out port internally demonstrates correct usage - out ports can drive but reading them internally depends on VHDL version. Tests the semantic boundary of out mode.
-- Expected Result: May or may not compile depending on tool VHDL version
-- Dependencies: None
-- =============================================================
entity mode_sem_out_read is
  port (
    data_in  : in  bit_vector(3 downto 0);
    data_out : out bit_vector(3 downto 0)
  );
end entity mode_sem_out_read;

architecture rtl of mode_sem_out_read is
  signal s_internal : bit_vector(3 downto 0);
begin
  s_internal <= data_in;
  data_out   <= s_internal xor "1010";
end architecture rtl;
