-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive
-- Test Focus: guarded_signal_specification with vector type and multiple guarded signals array -- exercises guarded_signal_list containing multiple bit_vector guarded signals with a composite type_mark (bit_vector with range constraint) in disconnect specification, testing that composite types are accepted as type_mark
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_vector_guard is
  port(
    clk      : in  std_logic;
    din_a    : in  std_logic_vector(7 downto 0);
    din_b    : in  std_logic_vector(7 downto 0);
    dout_a   : out std_logic_vector(7 downto 0) bus;
    dout_b   : out std_logic_vector(7 downto 0) bus
  );
end entity;

architecture rtl of gss_vector_guard is
  signal bus_reg_a : std_logic_vector(7 downto 0) bus := X"00";
  signal bus_reg_b : std_logic_vector(7 downto 0) bus := X"00";
  -- Multiple guarded signals sharing composite type_mark
  disconnect bus_reg_a, bus_reg_b : std_logic_vector after 4 ns;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      bus_reg_a <= din_a;
      bus_reg_b <= din_b;
    end if;
  end process;
  g_blk : block (clk = '1')
  begin
    dout_a <= guarded bus_reg_a;
    dout_b <= guarded bus_reg_b;
  end block;
end architecture rtl;
