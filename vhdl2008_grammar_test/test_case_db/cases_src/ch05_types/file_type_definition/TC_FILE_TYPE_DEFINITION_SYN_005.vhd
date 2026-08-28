-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Positive
-- Test Focus: Positive: file of bit for bitstream operations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: file of bit for bitstream operations
-- =============================================================
entity ftd_syn_bit_file is port(dout:out integer); end entity;
architecture rtl of ftd_syn_bit_file is
  type t_bitfile is file of bit;
  file f : t_bitfile open WRITE_MODE is "bits.dat";
begin process begin write(f, '1'); write(f, '0'); dout<=0; wait; end process; end architecture;