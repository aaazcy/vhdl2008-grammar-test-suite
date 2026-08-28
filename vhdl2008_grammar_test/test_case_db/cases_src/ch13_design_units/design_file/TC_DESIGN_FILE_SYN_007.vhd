-- =============================================================
-- Case ID: TC_DESIGN_FILE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_FILE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Positive
-- Test Focus: complete multi-design file: library std; use std.standard.all; entity_A + arch_A, library ieee; use ieee.std_logic_1164.all; entity_B + arch_B, use ieee.numeric_std.all; entity_C + arch_C — verifying multiple design_units with multi-layer context_clauses are parsed in order in the design_file
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Design unit 1
library std;
use std.standard.all;

entity df7_counter_ent is
  port (
    a : in  integer range 0 to 15;
    y : out integer range 0 to 15
  );
end entity df7_counter_ent;

architecture rtl of df7_counter_ent is
begin
  y <= a + 1;
end architecture rtl;

-- Design unit 2
library ieee;
use ieee.std_logic_1164.all;

entity df7_reg_ent is
  port (
    clk   : in  std_ulogic;
    rst_n : in  std_ulogic;
    d     : in  std_ulogic;
    q     : out std_ulogic
  );
end entity df7_reg_ent;

architecture rtl of df7_reg_ent is
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      q <= '0';
    elsif rising_edge(clk) then
      q <= d;
    end if;
  end process;
end architecture rtl;

-- Design unit 3
library ieee;
use ieee.numeric_std.all;

entity df7_adder_ent is
  port (
    a : in  unsigned(3 downto 0);
    b : in  unsigned(3 downto 0);
    s : out unsigned(4 downto 0)
  );
end entity df7_adder_ent;

architecture rtl of df7_adder_ent is
begin
  s <= resize(a, 5) + resize(b, 5);
end architecture rtl;
