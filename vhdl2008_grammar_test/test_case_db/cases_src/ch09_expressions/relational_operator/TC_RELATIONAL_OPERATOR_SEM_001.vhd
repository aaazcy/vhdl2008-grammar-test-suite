-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_RELATIONAL_OPERATOR_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Positive
-- Rule Description: The standard relational operators (=, /=, <, <=, >, >=) are predefined for any scalar type. The matching relational operators (?=, ?/=, ?<, ?<=, ?>, ?>=) are predefined for BIT, STD_ULOGIC and one-dimensional arrays thereof. Operands must be of the same type.
-- Test Focus: semantic correctness of relational_operator on the three scalar types integer/signed/boolean——equality and ordering comparisons of the standard operators on different data types all return boolean, verifying VHDL predefined relational type rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_std.all;

entity ent_sem_types is
  port (
    ia_i, ib_i  : in  integer;
    sa_i, sb_i  : in  signed(7 downto 0);
    ba_i, bb_i  : in  boolean;
    ieq_o       : out boolean;
    slt_o       : out boolean;
    beq_o       : out boolean
  );
end entity ent_sem_types;

architecture rtl of ent_sem_types is
begin
  ieq_o <= ia_i = ib_i;
  slt_o <= sa_i < sb_i;
  beq_o <= ba_i = bb_i;
end architecture rtl;
