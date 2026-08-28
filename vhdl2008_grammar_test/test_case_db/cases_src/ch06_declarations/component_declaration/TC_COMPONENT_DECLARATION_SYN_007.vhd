-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Component declaration using IEEE std_logic/std_logic_vector port types with in/out modes. Exercises component_declaration with standard logic types — a common real-world hardware design pattern for register-file components. Uses library ieee clause for std_logic visibility.
-- Expected Result: Compiles successfully
-- Dependencies: ieee.std_logic_1164
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity comp_stdlogic_ent is
  port(we   : in  std_logic;
       dout : out std_logic_vector(7 downto 0));
end entity comp_stdlogic_ent;

architecture bh of comp_stdlogic_ent is
  component comp_regfile is
    port(
      clk   : in  std_logic;
      we    : in  std_logic;
      addr  : in  std_logic_vector(3 downto 0);
      din   : in  std_logic_vector(7 downto 0);
      dout  : out std_logic_vector(7 downto 0)
    );
  end component comp_regfile;
  signal s_clk, s_we : std_logic;
  signal s_addr : std_logic_vector(3 downto 0);
  signal s_din  : std_logic_vector(7 downto 0);
begin
  s_clk <= '0';
  s_we  <= we;
  s_addr <= "0000";
  s_din  <= "00000000";
  dout <= "10101010";
end architecture bh;
