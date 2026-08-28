-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: srl used for a divide-equivalent operation — srl 2 is equivalent to dividing by 4, applying srl to a 16-bit std_logic_vector for fast integer division, verifying the logical shift application of shift_operator in a real datapath
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_srl_div4 is
  port (
    din  : in  std_logic_vector(15 downto 0);
    dout : out std_logic_vector(15 downto 0)
  );
end entity ent_srl_div4;

architecture rtl of ent_srl_div4 is
begin
  dout <= din srl 2;
end architecture rtl;
