-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_MULTIPLYING_OPERATOR_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Rule Description: * and / are predefined for any integer and floating-point types, and for physical types multiplied/divided by integers. mod and rem are predefined for any integer types only.
-- Test Focus: semantic correctness of * and / on the three numeric types integer, real, unsigned — verifying different type combinations of multiplying_operator: integer multiplication division and modulo, physical type times integer, unsigned division, demonstrating the VHDL predefined arithmetic operation type rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_sem_numeric_types is
  port (
    ia_i, ib_i : in  integer;
    ra_i, rb_i : in  real;
    ua_i, ub_i : in  unsigned(7 downto 0);
    t_i        : in  time;
    n_i        : in  integer;
    io_o       : out integer;
    ro_o       : out real;
    uo_o       : out unsigned(7 downto 0);
    to_o       : out time;
    imod_o     : out integer
  );
end entity ent_sem_numeric_types;

architecture rtl of ent_sem_numeric_types is
begin
  io_o   <= ia_i * ib_i;
  ro_o   <= ra_i / rb_i;
  uo_o   <= ua_i / ub_i;
  to_o   <= t_i * n_i;
  imod_o <= ia_i mod 10;
end architecture rtl;
