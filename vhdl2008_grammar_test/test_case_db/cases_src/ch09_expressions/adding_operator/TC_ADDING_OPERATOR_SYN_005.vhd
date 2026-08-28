-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Test Focus: The concatenation operator & assembles single-bit signals into a vector - several std_logic signals are chained with & into a control-word vector, verifying repeated chained concatenation of single bits into a vector by the & operator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_concat_ctrl is
  port (
    enable   : in  std_logic;
    write_en : in  std_logic;
    read_en  : in  std_logic;
    burst    : in  std_logic;
    ctrl_word: out std_logic_vector(3 downto 0)
  );
end entity ent_concat_ctrl;

architecture rtl of ent_concat_ctrl is
begin
  ctrl_word <= enable & write_en & read_en & burst;
end architecture rtl;
