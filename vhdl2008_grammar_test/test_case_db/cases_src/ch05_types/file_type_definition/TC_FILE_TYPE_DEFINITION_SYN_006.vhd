-- =============================================================
-- Case ID: TC_FILE_TYPE_DEFINITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_type_definition ::= file of type_mark
-- Case Type: Positive
-- Test Focus: Positive: file of a constrained array subtype (byte pattern)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: file of a constrained array subtype (byte pattern)
-- =============================================================
entity ftd_syn_array_file is port(dout:out integer); end entity;
architecture rtl of ftd_syn_array_file is
  type t_byte is array(7 downto 0) of bit;
  type t_bytefile is file of t_byte;
  file f : t_bytefile open WRITE_MODE is "bytes.dat";
  constant C_BYTE : t_byte := "10101010";
begin process begin write(f, C_BYTE); dout<=0; wait; end process; end architecture;