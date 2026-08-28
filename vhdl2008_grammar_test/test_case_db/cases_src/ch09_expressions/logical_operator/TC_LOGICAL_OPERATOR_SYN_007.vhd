-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Test Focus: and and xor used in ALU operations on std_logic_vector data — two operands bitwise ANDed and bitwise XORed to produce two independent result outputs, verifying the parallel use of logical_operator in a combinational logic datapath
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_alu_logic is
  port (
    op_a    : in  std_logic_vector(7 downto 0);
    op_b    : in  std_logic_vector(7 downto 0);
    res_and : out std_logic_vector(7 downto 0);
    res_xor : out std_logic_vector(7 downto 0)
  );
end entity ent_alu_logic;

architecture rtl of ent_alu_logic is
begin
  res_and <= op_a and op_b;
  res_xor <= op_a xor op_b;
end architecture rtl;
