-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: All six shift_operators in a barrel shifter inside one process — the opcode selects one of sll/srl/sla/sra/rol/ror to perform the shift, verifying the separate use of all six shift operators in a single design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_barrel_shifter is
  port (
    op_sel : in  integer range 0 to 5;
    din    : in  unsigned(7 downto 0);
    sh_amt : in  integer range 0 to 7;
    dout   : out unsigned(7 downto 0)
  );
end entity ent_barrel_shifter;

architecture rtl of ent_barrel_shifter is
begin
  process(op_sel, din, sh_amt)
  begin
    case op_sel is
      when 0 => dout <= din sll sh_amt;
      when 1 => dout <= din srl sh_amt;
      when 2 => dout <= din sla sh_amt;
      when 3 => dout <= din sra sh_amt;
      when 4 => dout <= din rol sh_amt;
      when 5 => dout <= din ror sh_amt;
    end case;
  end process;
end architecture rtl;
