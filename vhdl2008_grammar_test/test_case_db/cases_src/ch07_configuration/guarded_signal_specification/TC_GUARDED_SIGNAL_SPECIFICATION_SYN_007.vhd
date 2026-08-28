-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive
-- Test Focus: guarded_signal_specification with register-kind guarded signals -- exercises disconnect specification on signals declared with "register" kind (not "bus"), verifying that both guarded signal kinds (bus and register) are valid targets for disconnect with guarded_signal_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_register_kind is
  port(
    clk    : in  std_logic;
    din    : in  std_logic_vector(3 downto 0);
    dout   : out std_logic_vector(3 downto 0) bus
  );
end entity;

architecture rtl of gss_register_kind is
  signal reg_out : std_logic_vector(3 downto 0) register := "0000";
  -- disconnect on register-kind guarded signal
  disconnect reg_out : std_logic_vector after 6 ns;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      reg_out <= din;
    end if;
  end process;
  g_blk : block (clk = '1')
  begin
    dout <= guarded reg_out;
  end block;
end architecture rtl;
