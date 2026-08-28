-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ADDING_OPERATOR_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Rule Description: + and - operators work on any numeric type; the result type is the same as the operands after implicit conversions. Both operands must be of the same numeric type.
-- Test Focus: Semantic correctness of the + and - operators across numeric subtypes - using natural, integer, signed, unsigned numeric types to perform + and - operations, verifying that the arithmetic semantics of adding_operator follow the IEEE 1076-2008 type rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_sem_numeric_ops is
  port (
    na_i, nb_i : in  natural range 0 to 255;
    ia_i, ib_i : in  integer range -128 to 127;
    sa_i, sb_i : in  signed(7 downto 0);
    ua_i, ub_i : in  unsigned(7 downto 0);
    no_o       : out natural range 0 to 510;
    io_o       : out integer range -256 to 254;
    so_o       : out signed(8 downto 0);
    uo_o       : out unsigned(8 downto 0)
  );
end entity ent_sem_numeric_ops;

architecture rtl of ent_sem_numeric_ops is
begin
  no_o <= na_i + nb_i;
  io_o <= ia_i - ib_i;
  so_o <= resize(sa_i, 9) + resize(sb_i, 9);
  uo_o <= resize(ua_i, 9) - resize(ub_i, 9);
end architecture rtl;
