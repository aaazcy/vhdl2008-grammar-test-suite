-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Test Focus: The concatenation operator & joins two std_logic_vector segments to form a bus address - the high address segment and the low offset segment are concatenated into a full address with &, verifying the vector concatenation capability of & in concurrent signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_concat_addr is
  port (
    page_addr  : in  std_logic_vector(3 downto 0);
    byte_offset: in  std_logic_vector(1 downto 0);
    full_addr  : out std_logic_vector(5 downto 0)
  );
end entity ent_concat_addr;

architecture rtl of ent_concat_addr is
begin
  full_addr <= page_addr & byte_offset;
end architecture rtl;
