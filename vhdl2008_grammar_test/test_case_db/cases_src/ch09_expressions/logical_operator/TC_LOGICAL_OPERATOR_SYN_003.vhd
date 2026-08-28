-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Positive
-- Test Focus: use of the or and nor operators in std_logic control logic — multiple interrupt signals merged with or, nor used to produce an active-low reset condition, verifying the syntax of the two logical_operators in a real hardware control path
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_or_nor_ctrl is
  port (
    irq_a    : in  std_logic;
    irq_b    : in  std_logic;
    irq_c    : in  std_logic;
    reset_a  : in  std_logic;
    reset_b  : in  std_logic;
    irq_out  : out std_logic;
    rst_out  : out std_logic
  );
end entity ent_or_nor_ctrl;

architecture rtl of ent_or_nor_ctrl is
begin
  irq_out <= irq_a or irq_b or irq_c;
  rst_out <= reset_a nor reset_b;
end architecture rtl;
